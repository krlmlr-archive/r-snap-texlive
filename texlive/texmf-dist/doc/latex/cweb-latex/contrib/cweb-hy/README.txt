Dear User:

I present to you an evolution of the excellent CWEB class, originally by 
Joachim Schrod.  
The purpose of the new files is twofold:

1.- To allow a file written using this class to be included in other
documents, as for instance as an appendix to some report.  For this,
the file nodoc.tex may be of help.

2.- To insert hyperlinks from the places where a chunk of code is
referenced to the chunk itself, including the indices that are produced at
the end of cweb document.  The result  makes it a lot more easy to follow
the code if it is typeset using PDFLaTeX, or is otherwise processed
to obtain a PDF or an HTML file, and makes no harm in the paper version
of the document.

The installation is straightforward.  Put the files cweb-hy.cls and
cwbasehy.tex where TeX can find them.  Since cweb.cls was installed
under tex/latex/literate, may I suggest you put all these files under
tex/latex/liter-hy, all paths relative to your TEXMF hierarchy.

1 The Class as a Package.

For using the class as a normal package (with \usepackage{cweb-hy}), you
simply have to copy the file cweb-hy.cls with the name cweb-hy.sty, so
that it is found by LaTeX.  

How this works I can explain as follows.  Suppose you have a file called
whatever.w such as

--------------------------------------
% Very simple CWEB
\documentclass[]{cweb-hy}
\usepackage[T1]{fontenc}
\usepackage{ae}
\begin{document}
\title{Whatever}
\author{Me}

@* CWEB program.
This is your program.
@c
@<Header files@>@/
@<Main program@>

@ If we want to use the system resources, we must insert the definition
of the standard functions.

@<Header...@>=
#include <stdio.h>

@ The code makes whatever.

@<Main...@>=
int
main(void)
{
printf("Whatever\n");
exit(0);
}
@ \end{document}
--------------------------------------
And suppose further that you want to make a report including your
beautifully typeset program (with CWEB and TeX).
Well, with the CWEB class as it stands, you can't.  However, with the very
simple changes I have implemented, you could say

\documentclass{report}
\title{All my life's programs}
\author{Me}
\begin{document}
\part{Rationale}
Blah, Blah...

\part{Programs}
\section{Makes Whatever}
\input{whatever}
\end{document}

and the file whatever.tex will get just in with all your very skillful
code and clear documentation, everything typeset by TeX.  The package
accepts almost all the options the class does, but I decided not to
include some auxiliary files with the cross-references in the former
case.  For two reasons.  I am unsure as to how to do it and it is a
bit overwhelming if you are in a large document to have these sections.
I guess it can be done, however, and I guess you may like it.  Drop me a
mail in this case.

You may now say to yourself, how is this going to work, if in my
file whatever.tex there is a \documentclass, etc. all forbidden in
a document's body?  You have two choices.  One is to delete all the
offending commands and \input the diminished file. Another is to use
nodoc.tex which I also provide.  This nodoc.tex inhibits all offending
commands for a while ---long enough for LaTeX not noticing it---,
and restores the definitions just in time for you to have your dose of
error-messages if you dare putting a preamble macro in the wrong place.
For using it, simply add an \input{nodoc} at the very beginning of your
file, and you will then be allowed both to typeset your file with LaTeX
directly and to include it in other files, at the expense of a very
limited memory use.

2. Making screen versions of your programs

Programs are cumbersome to follow.  With CWEB your programs get a
better structure, are better typeset and are more easy to understand.
They remain, however, hard to follow because you have to move paper to
and fro, looking for the referenced code. Using this new package, and
if the documentation file (the one obtained with cweave) is processed to
provide a screen version that can use hyperlinks (such as with PDFLaTeX,
xdvi, dvipdfm) with the help of the hyperref package, the screen version
you get has all the program chunks linked and referenced, so that when
one is used or cited, there is a link you can click on to get to the
adequate place.  If you do not use the hyperref package no harm is done
and the changes take no effect.

Enjoy yourself with this demonstration of my clumsy TeX programming,
and let me know if you experience any problems.  Please write to Enrique
Meléndez <UEI0560130010@eurociber.es> in case of failure, being as
precise as you can with the error, possibly with a short example
that demonstrates the failure, and providing a workaround (in the best of
the worlds :-))

Regards,
Enrique Meléndez

By the way, no responsibility is held.  I did this for fun (among other
things) and it worked for me.  it may not work for you or, if it works,
it may not perform exactly as you intended.  If you write to me I can
try my best to solve your problem (and I probably will try), but I make no
formal promises.  See the GNU public license for details.
