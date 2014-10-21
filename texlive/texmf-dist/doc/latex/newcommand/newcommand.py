#! /usr/bin/env python

# -----------------------------------------------------------------------
# Convert a macro prototype to a LaTeX \newcommand
# By Scott Pakin <scott+nc@pakin.org>
# -----------------------------------------------------------------------
# Copyright (C) 2010 Scott Pakin, scott+nc@pakin.org
#
# This package may be distributed and/or modified under the conditions
# of the LaTeX Project Public License, either version 1.3c of this
# license or (at your option) any later version.  The latest version of
# this license is in:
#
#     http://www.latex-project.org/lppl.txt
#
# and version 1.3c or later is part of all distributions of LaTeX version
# 2006/05/20 or later.
# -----------------------------------------------------------------------

from spark import GenericScanner, GenericParser, GenericASTTraversal
import re
import copy

class ParseError(Exception):
    "Represent any error that occurs during processing."
    pass


class Token:
    "Represent a single lexed token."

    def __init__(self, type, charOffset, attr=None):
        self.type = type
        self.attr = attr
        self.charOffset = charOffset

    def __cmp__(self, o):
        return cmp(self.type, o)

    def __str__(self):
        return self.attr


class AST:
    "Represent an abstract syntax tree."

    def __init__(self, type, charOffset, attr=None, kids=[]):
        self.type = type
        self.charOffset = charOffset
        self.attr = attr
        self.kids = kids

    def __getitem__(self, child):
        return self.kids[child]

    def __len__(self):
        return len(self.kids)


class CmdScanner(GenericScanner):
    "Defines a lexer for macro prototypes."

    def __init__(self):
        GenericScanner.__init__(self)
        self.charOffset = 0

    def tokenize(self, input):
        self.rv = []
        GenericScanner.tokenize(self, input)
        return self.rv

    def t_whitespace(self, whiteSpace):
        r' [\s\r\n]+ '
        self.charOffset = self.charOffset + len(whiteSpace)

    def t_command(self, cmd):
        r' MACRO '
        self.rv.append(Token(type='command',
                             attr=cmd,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(cmd)

    def t_argument_type(self, arg):
        r' OPT '
        self.rv.append(Token(type='argtype',
                             attr=arg,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(arg)

    def t_argument(self, arg):
        r' \#\d+ '
        self.rv.append(Token(type='argument',
                             attr=arg,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(arg)

    def t_equal(self, equal):
        r' = '
        self.rv.append(Token(type=equal,
                             attr=equal,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(equal)

    def t_quoted(self, quoted):
        r' \{[^\}]*\} '
        self.rv.append(Token(type='quoted',
                             attr=quoted,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(quoted)

    def t_identifier(self, ident):
        r' [A-Za-z]+ '
        self.rv.append(Token(type='ident',
                             attr=ident,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(ident)

    def t_delimiter(self, delim):
        r' [()\[\]] '
        self.rv.append(Token(type='delim',
                             attr=delim,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(delim)

    def t_other(self, other):
        r' [^()\[\]\{\}\#\s\r\n]+ '
        self.rv.append(Token(type='other',
                             attr=other,
                             charOffset=self.charOffset))
        self.charOffset = self.charOffset + len(other)


class CmdParser(GenericParser):
    "Defines a parser for macro prototypes."

    def __init__(self, start='decl'):
        GenericParser.__init__(self, start)

    def error(self, token):
        raise ParseError, \
            ("Syntax error", 1+token.charOffset)

    def p_optarg(self, args):
        ' optarg ::= argtype delim defvals delim '
        return AST(type='optarg',
                   charOffset=args[0].charOffset,
                   attr=(args[1].attr, args[3].attr),
                   kids=[args[2]])

    def p_rawtext(self, args):
        ' rawtext ::= other '
        return AST(type='rawtext',
                   charOffset=args[0].charOffset,
                   attr=args[0].attr)

    def p_defval(self, args):
        ' defval ::= argument = quoted '
        return AST(type='defval',
                   charOffset=args[0].charOffset,
                   attr=(args[0].attr, args[2].attr))

    def p_defvals_1(self, args):
        ' defvals ::= defval '
        return AST(type='defvals',
                   charOffset=args[0].charOffset,
                   kids=args)

    def p_defvals_2(self, args):
        '''
        defvals ::= defval rawtext defvals
        defvals ::= defval ident defvals
        defvals ::= defval quoted defvals
        '''
        return AST(type='defvals',
                   charOffset=args[0].charOffset,
                   attr=(args[1].type, args[1].attr, args[1].charOffset),
                   kids=[args[0],args[2]])

    # Top-level macro argument
    def p_arg_1(self, args):
        '''
        arg ::= quoted
        arg ::= argument
        '''
        return AST(type='arg',
                   charOffset=args[0].charOffset,
                   attr=[args[0].type]+[args[0].attr])

    def p_arg_2(self, args):
        ' arg ::= optarg '
        return AST(type='arg',
                   charOffset=args[0].charOffset,
                   attr=[args[0].type]+[args[0].attr],
                   kids=args[0].kids)

    def p_arg_3(self, args):
        ' arg ::= rawtext '
        if args[0].attr != "*":
            raise ParseError, \
                ('Literal text must be quoted between "{" and "}"',
                 args[0].charOffset + 1)
        return AST(type='arg',
                   charOffset=args[0].charOffset,
                   attr=[args[0].type]+[args[0].attr])

    def p_arglist_1(self, args):
        ' arglist ::= arg '
        return AST(type='arglist',
                   charOffset=args[0].charOffset,
                   kids=args)

    def p_arglist_2(self, args):
        ' arglist ::= arg arglist '
        return AST(type='arglist',
                   charOffset=args[0].charOffset,
                   kids=args)

    def p_decl_1(self, args):
        ' decl ::= command ident '
        return AST(type='decl',
                   charOffset=args[0].charOffset,
                   attr=(args[0].attr, args[1].attr),
                   kids=[])

    def p_decl_2(self, args):
        ' decl ::= command ident arglist '
        return AST(type='decl',
                   charOffset=args[0].charOffset,
                   attr=(args[0].attr, args[1].attr),
                   kids=[args[2]])


def flattenAST(ast):
    class FlattenAST(GenericASTTraversal):
        "Flatten an AST into a list of arguments."

        def __init__(self, ast):
            GenericASTTraversal.__init__(self, ast)
            self.postorder()
            self.argList = ast.argList

        def n_defval(self, node):
            node.argList = (node.attr[0], node.attr[1], node.charOffset)

        def n_defvals(self, node):
            node.argList = [node.kids[0].argList]
            if node.attr:
                node.argList = node.argList + [node.attr] + node.kids[1].argList

        def n_arg(self, node):
            if node.attr[0] == "optarg":
                node.argList = node.attr + node.kids[0].argList
            else:
                node.argList = tuple(node.attr + [node.charOffset])

        def n_arglist(self, node):
            node.argList = [node.kids[0].argList]
            if len(node.kids) == 2:
                node.argList = node.argList + node.kids[1].argList

        def n_decl(self, node):
            node.argList = [(node.attr[0], node.attr[1], node.charOffset)]
            if node.kids != []:
                node.argList = node.argList + node.kids[0].argList

        def default(self, node):
            raise ParseError, \
                ('Internal error -- node type "%s" was unexpected' % node.type,
                 1+node.charOffset)

    return FlattenAST(ast).argList


def checkArgList(argList):
    "Raise an error if any problems are detected with the given argument list."

    def getFormals(sublist):
        "Return the formal-parameter numbers in the order in which they appear."
        if sublist == []:
            return []
        head = sublist[0]
        headval = []
        if head[0] == "argument":
            headval = [(int(head[1][1:]), head[2])]
        elif head[0][0] == "#":
            headval = [(int(head[0][1:]), head[2])]
        elif head[0] == "optarg":
            headval = getFormals(head[2:])
        return headval + getFormals(sublist[1:])

    # Ensure the formals appear in strict increasing order.
    formals = getFormals(argList)
    prevformal = 0
    for form, pos in formals:
        if form != prevformal + 1:
            raise ParseError, \
                ("Expected parameter %d but saw parameter %d" % (prevformal+1, form), 1+pos)
        prevformal = form

    # Ensure that "*" appears at most once at the top level.
    seenStar = False
    for arg in argList:
        if arg[0] == "rawtext" and arg[1] == "*":
            if seenStar:
                raise ParseError, \
                    ("Only one star parameter is allowed", arg[2])
            seenStar = True

    # Ensure that no optional argument contains more than nine formals.
    for arg in argList:
        if arg[0] == "optarg":
            optFormals = 0
            for oarg in arg[2:]:
                if oarg[0][0] == "#":
                    optFormals += 1
                    if optFormals > 9:
                        raise ParseError, \
                            ("An optional argument can contain at most nine formals",
                             oarg[2])

    # Ensure that "#" is used only where it's allowed.
    for arg in argList:
        if arg[0] in ["rawtext", "quoted"]:
            hashidx = string.find(arg[1], "#")
            if hashidx == 0 or (hashidx > 0 and arg[1][hashidx-1] != "\\"):
                if arg[0] == "quoted":
                    hashidx += 1
                raise ParseError, \
                    ('The "#" character cannot be used as a literal character unless escaped with "\\"',
                     arg[2] + hashidx)
        elif arg[0] == "optarg":
            for oarg in arg[2:]:
                if oarg[0] in ["rawtext", "quoted"]:
                    hashidx = string.find(oarg[1], "#")
                    if hashidx == 0 or (hashidx > 0 and oarg[1][hashidx-1] != "\\"):
                        if oarg[0] == "quoted":
                            hashidx += 1
                        raise ParseError, \
                            ('The "#" character cannot be used as a literal character unless escaped with "\\"',
                             oarg[2] + hashidx)


class LaTeXgenerator():
    "Generate LaTeX code from a list of arguments."

    def __init__(self):
        "Initialize all of LaTeXgenerator's instance variables."
        self.argList = []             # List of arguments provided to generate()
        self.topLevelName = "???"     # Base macro name
        self.haveStar = False         # True=need to define \ifNAME@star
        self.haveAt = False           # True=need to use \makeatletter...\makeatother
        self.numFormals = 0           # Total number of formal arguments
        self.codeList = []            # List of lines of code to output

    def toRoman(self, num):
        "Convert a decimal number to roman."
        dec2rom = [("m",  1000),
                   ("cm",  900),
                   ("d",   500),
                   ("cd",  400),
                   ("c",   100),
                   ("xc",   90),
                   ("l",    50),
                   ("xl",   40),
                   ("x",    10),
                   ("ix",    9),
                   ("v",     5),
                   ("iv",    4),
                   ("i",     1)]
        romanStr = ""
        if num > 4000:
            raise ParseError, ("Too many arguments", 0)
        for rom, dec in dec2rom:
            while num >= dec:
                romanStr += rom
                num -= dec
        return romanStr

    def partitionArgList(self):
        "Group arguments, one per macro to generate."
        self.argGroups = []
        argIdx = 1

        # Specially handle the first group because it's limited by
        # \newcomand's semantics.
        group = []
        if len(self.argList) == 1:
            # No arguments whatsoever
            self.argGroups.append(group)
            return
        arg = self.argList[argIdx]
        if arg[0] == "optarg" and arg[1] == ("[", "]") and len(arg) == 3:
            group.append(arg)
            argIdx += 1
        while len(group) < 9 and argIdx < len(self.argList) and self.argList[argIdx][0] == "argument":
            group.append(self.argList[argIdx])
            argIdx += 1
        self.argGroups.append(group)

        # Handle the remaining groups, each ending before an optional
        # argument.
        group = []
        numFormals = 0
        for arg in self.argList[argIdx:]:
            if arg[0] == "rawtext":
                # Treat "*" as an optional argument.
                if arg[1] == "*":
                    if group != []:
                        self.argGroups.append(group)
                        group = []
                    numFormals = 0
                group.append(arg)
            elif arg[0] == "quoted":
                group.append(arg)
            elif arg[0] == "argument":
                group.append(arg)
                numFormals += 1
                if numFormals == 9:
                    if group != []:
                        self.argGroups.append(group)
                        group = []
                    numFormals = 0
            elif arg[0] == "optarg":
                # Note that we know from checkArgList() that there are
                # no more than 10 formals specified within the
                # optional argument.
                if group != []:
                    self.argGroups.append(group)
                    group = []
                numFormals = 0
                optarg = arg[0:2]
                for oarg in arg[2:]:
                    if oarg[0] in ["rawtext", "quoted"]:
                        optarg.append(oarg)
                    elif oarg[0][0] == "#":
                        numFormals += 1
                        optarg.append(oarg)
                    else:
                        optarg.append(oarg)
                group.append(optarg)
        if group != []:
            self.argGroups.append(group)

    def argsToString(self, argList, mode, argSubtract=0):
        '''
            Produce a string version of a list of arguments.
            mode is one of "define", "call", or "calldefault".
            argSubtract is subtracted from each argument number.
        '''
        if mode not in ["define", "call", "calldefault"]:
            raise ParseError, ('Internal error (mode="%s")' % mode, argList[0][2])
        argStr = ""
        findArgRE = re.compile('#(\d+)')
        for arg in argList:
            if arg[0] == "argument":
                if mode == "define":
                    argStr += "#%d" % (int(arg[1][1:]) - argSubtract)
                else:
                    argStr += "{#%d}" % (int(arg[1][1:]) - argSubtract)
            elif arg[0] == "rawtext":
                argStr += arg[1]
            elif arg[0] == "quoted":
                argStr += arg[1][1:-1]
            elif arg[0] == "optarg":
                argStr += arg[1][0]
                for oarg in arg[2:]:
                    if oarg[0][0] == "#":
                        if mode == "define":
                            argStr += "#%d" % (int(oarg[0][1:]) - argSubtract)
                        elif mode == "call":
                            argStr += "{#%d}" % (int(oarg[0][1:]) - argSubtract)
                        else:
                            if self.numFormals > 9:
                                argStr += findArgRE.sub(lambda a: "\\"+self.topLevelName+"@arg@"+self.toRoman(int(a.group(0)[1:])),
                                                        oarg[1])
                            else:
                                argStr += oarg[1]
                    elif oarg[0] == "quoted":
                        argStr += oarg[1][1:-1]
                    elif oarg[0] == "rawtext":
                        argStr += oarg[1]
                    else:
                        raise ParseError, ('Internal error ("%s")' % oarg[0],
                                           oarg[2])
                argStr += arg[1][1]
            else:
                raise ParseError, ('Internal error ("%s")' % arg[0], arg[2])
        return argStr

    def callMacro(self, macroNum):
        "Return an array of strings suitable for calling macro macroNum."
        if macroNum >= len(self.argGroups):
            # No more macros.
            return []
        macroName = "\\%s@%s" % (self.topLevelName, self.toRoman(macroNum))
        nextArg = self.argGroups[macroNum][0]
        callSeq = []
        if self.numFormals > 9:
            # More than nine formal parameters
            if nextArg[0] == "optarg":
                callSeq.append("  \\@ifnextchar%s{%s}{%s%s}%%" % \
                                   (nextArg[1][0], macroName, macroName,
                                    self.argsToString([nextArg], mode="calldefault")))
            elif nextArg[0] == "rawtext" and nextArg[1] == "*":
                callSeq.append("  \\@ifstar{\\%s@startrue%s*}{\\%s@starfalse%s*}%%" % \
                                   (self.topLevelName, macroName,
                                    self.topLevelName, macroName))
            else:
                callSeq.append("  %s" % macroName)
        else:
            # Nine or fewer formal parameters
            argStr = ""
            for g in range(0, macroNum):
                argStr += self.argsToString(self.argGroups[g], mode="call")
            if nextArg[0] == "optarg":
                callSeq.append("  \\@ifnextchar%s{%s%s}{%s%s%s}%%" % \
                                   (nextArg[1][0],
                                    macroName, argStr, macroName, argStr,
                                    self.argsToString([nextArg], mode="calldefault")))
            elif nextArg[0] == "rawtext" and nextArg[1] == "*":
                callSeq.append("  \\@ifstar{\\%s@startrue%s%s*}{\\%s@starfalse%s%s*}%%" % \
                                   (self.topLevelName, macroName, argStr,
                                    self.topLevelName, macroName, argStr))
            else:
                callSeq.append("  %s%s%%" % (macroName, argStr))
        return callSeq

    def putCodeHere(self):
        'Return an array of strings representing "Put code here".'
        code = []
        if self.haveStar:
            code.extend(["  \\if%s@star" % self.topLevelName,
                         '    % Put code for the "*" case here.',
                         "  \\else",
                         '    % Put code for the non-"*" case here.',
                         "  \\fi",
                         "  %% Put code common to both cases here (and/or above the \\if%s@star)." % self.topLevelName])
        else:
            code.append("  % Put your code here.")
        if self.numFormals == 0:
            return code
        if self.numFormals > 9:
            firstArgName = "\\%s@arg@i" % self.topLevelName
            lastArgName = "\\%s@arg@%s" % (self.topLevelName, self.toRoman(self.numFormals))
        else:
            firstArgName = "#1"
            lastArgName = "#%d" % self.numFormals
        if self.numFormals == 1:
            code.append("  %% You can refer to the argument as %s." % firstArgName)
        elif self.numFormals == 2:
            code.append("  %% You can refer to the arguments as %s and %s." % (firstArgName, lastArgName))
        else:
            code.append("  %% You can refer to the arguments as %s through %s." % (firstArgName, lastArgName))
        return code

    def produceTopLevel(self):
        "Generate the code for the top-level macro definition."
        # Generate the macro definition.
        defStr = "\\newcommand{\\%s}" % self.topLevelName
        argList = self.argGroups[0]
        if argList != []:
            defStr += "[%d]" % len(argList)
            firstArg = argList[0]
            if firstArg[0] == "optarg":
                defVal = firstArg[2][1][1:-1]
                if string.find(defVal, "]") != -1:
                    defVal = "{%s}" % defVal
                defStr += "[%s]" % defVal
        defStr += "{%"
        self.codeList.append(defStr)

        # Generate the macro body.
        if len(self.argGroups) == 1:
            # Single macro definition.
            self.codeList.extend(self.putCodeHere())
        else:
            # More macros are forthcoming.
            if self.numFormals > 9:
                # More than nine formal parameters
                for f in range(1, len(argList)+1):
                    self.codeList.append("  \\def\\%s@arg@%s{#%d}%%" % (self.topLevelName, self.toRoman(f), f))
            self.codeList.extend(self.callMacro(1))
        self.codeList.append("}")

    def produceRemainingMacros(self):
        "Generate code for all macros except the first."
        formalsSoFar = len(self.argGroups[0])
        for groupNum in range(1, len(self.argGroups)):
            # Generate the macro header.
            self.codeList.append("")
            argList = self.argGroups[groupNum]
            defStr = "\\def\\%s@%s" % (self.topLevelName, self.toRoman(groupNum))
            if self.numFormals > 9:
                defStr += self.argsToString(argList, mode="define", argSubtract=formalsSoFar)
            else:
                for g in range (0, groupNum+1):
                    defStr += self.argsToString(self.argGroups[g], mode="define")
            self.codeList.append(defStr + "{%")

            # Generate the macro body.
            if self.numFormals > 9:
                # More than nine formal parameters
                for arg in argList:
                    if arg[0] == "argument":
                        formalNum = int(arg[1][1:])
                        self.codeList.append("  \\def\\%s@arg@%s{#%d}%%" % \
                                                 (self.topLevelName,
                                                  self.toRoman(formalNum),
                                                  formalNum - formalsSoFar))
                    elif arg[0] == "optarg":
                        for oarg in arg[2:]:
                            if oarg[0][0] == "#":
                                formalNum = int(oarg[0][1:])
                                self.codeList.append("  \\def\\%s@arg@%s{#%d}%%" % \
                                                         (self.topLevelName,
                                                          self.toRoman(formalNum),
                                                          formalNum - formalsSoFar))
                if groupNum == len(self.argGroups) - 1:
                    self.codeList.extend(self.putCodeHere())
                else:
                    self.codeList.extend(self.callMacro(groupNum + 1))
            else:
                # Nine or fewer formal parameters.
                if groupNum == len(self.argGroups) - 1:
                    self.codeList.extend(self.putCodeHere())
                else:
                    self.codeList.extend(self.callMacro(groupNum + 1))

            # Generate the macro trailer.
            self.codeList.append("}")

            # Increment the count of formals seen so far.
            for arg in argList:
                if arg[0] == "argument":
                    formalsSoFar += 1
                elif arg[0] == "optarg":
                    formalsSoFar += len(filter(lambda o: o[0][0] == "#", arg[2:]))

    def generate(self, argList):
        "Generate LaTeX code from an argument list."
        # Group arguments and identify characteristics that affect the output.
        self.argList = argList
        self.partitionArgList()
        self.haveAt = len(self.argGroups) > 1
        self.haveStar = filter(lambda arg: arg[0]=="rawtext" and arg[1]=="*", self.argList) != []
        self.topLevelName = self.argList[0][1]
        for arg in self.argList:
            if arg[0] == "argument":
                self.numFormals += 1
            elif arg[0] == "optarg":
                for oarg in arg[2:]:
                    if oarg[0][0] == "#":
                        self.numFormals += 1

        # Output LaTeX code.
        if self.haveAt:
            self.codeList.append("\\makeatletter")
        if self.haveStar:
            self.codeList.append("\\newif\\if%s@star" % self.topLevelName)
        self.produceTopLevel()
        self.produceRemainingMacros()
        if self.haveAt:
            self.codeList.append("\\makeatother")
        for codeLine in self.codeList:
            print codeLine


# The buck starts here.
if __name__ == '__main__':
    import sys
    import string

    def processLine():
        "Parses the current value of oneLine."
        global oneLine
        try:
            sys.stdout.softspace = 0        # Cancel the %$#@! space.
            oneLine = string.strip(oneLine)
            if oneLine=="" or oneLine[0]=="%":
                return
            if not isStdin:
                print prompt, oneLine
            scanner = CmdScanner()
            parser = CmdParser()
            tokens = scanner.tokenize(oneLine)
            ast = parser.parse(tokens)
            argList = flattenAST(ast)
            checkArgList(argList)
            gen = LaTeXgenerator()
            gen.generate(argList)
        except ParseError,(message, pos):
            sys.stderr.write((" "*(len(prompt)+pos)) + "^\n")
            sys.stderr.write("%s: %s.\n" % (sys.argv[0], message))
        if isStdin:
            print ""

    sys.setrecursionlimit(5000)
    prompt = "% Prototype:"
    if len(sys.argv) <= 1:
        isStdin = 1
        print prompt + " ",
        while 1:
            oneLine = sys.stdin.readline()
            if not oneLine:
                break
            processLine()
            print prompt + " ",
    else:
        isStdin = 0
        oneLine = string.join(sys.argv[1:])
        processLine()
