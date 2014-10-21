#! /usr/bin/env python
# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.

# Used uni0162 for Tcedilla and uni021A for Tcommaaccent

import os, sys, re

class KernReader:
    def __init__(self, filename):
        self.filename = filename
    def getkerns(self, regex):
        a = []
        f = open(self.filename, "r")
        while True:
            s = f.readline()
            if s == "": break	# end of file
            if re.match(regex, s):
                a.append(s)
        f.close()
	return a


class KernWriter:
    # TODO: improve methods for quotes; probably merge them; also accented small caps; look
    #       also at other types of quotes, such as Polish and French; start with improving
    #       aacute.SC + quotedblleft and adieresis.SC + quotedblleft
    # TODO: several methods could be merged (simpler code, but worse result to report to Victor)
    kernpairscapital = [
	["V A", "V Aacute", "V Abreve", "V Acircumflex", "V Adieresis", "V AE", "V Agrave", "V Amacron", "V Aogonek", "V Aring", "V Atilde"],
	["A Y", "A Yacute", "A Ydieresis", "Aacute Y", "Abreve Y", "Acircumflex Y", "Adieresis Y", "Agrave Y", "Amacron Y", "Aogonek Y", "Aring Y", "Atilde Y", "Aacute Yacute"],
	["L V", "Lcommaaccent V", "Lslash V"],
	["A V", "Aacute V", "Abreve V", "Acircumflex V", "Adieresis V", "Agrave V", "Amacron V", "Aogonek V", "Aring V", "Atilde V"],
	["W A", "W Aacute", "W Abreve", "W Acircumflex", "W Adieresis", "W AE", "W Agrave", "W Amacron", "W Aogonek", "W Aring", "W Atilde"],
	["Y A", "Y Aacute", "Y Abreve", "Y Acircumflex", "Y Adieresis", "Y AE", "Y Agrave", "Y Amacron", "Y Aogonek", "Y Aring", "Y Atilde", "Yacute A", "Ydieresis A", "Yacute Aacute"],
	["F A", "F Aacute", "F Abreve", "F Acircumflex", "F Adieresis", "F AE", "F Agrave", "F Amacron", "F Aogonek", "F Aring", "F Atilde"],
	["L Y", "L Yacute", "L Ydieresis", "Lcommaaccent Y", "Lslash Y"],
	["L T", "L Tcaron", "L uni0162", "L uni021A", "Lcommaaccent T", "Lslash T"],
	["A W", "Aacute W", "Abreve W", "Acircumflex W", "Adieresis W", "Agrave W", "Amacron W", "Aogonek W", "Aring W", "Atilde W"],
	["P A", "P Aacute", "P Abreve", "P Acircumflex", "P Adieresis", "P AE", "P Agrave", "P Amacron", "P Aogonek", "P Aring", "P Atilde"],
	["T A", "T Aacute", "T Abreve", "T Acircumflex", "T Adieresis", "T AE", "T Agrave", "T Amacron", "T Aogonek", "T Aring", "T Atilde", "Tcaron A", "uni0162 A", "uni021A A", "Tcaron Aacute"],
	["A T", "A Tcaron", "A uni0162", "A uni021A", "Aacute T", "Abreve T", "Acircumflex T", "Adieresis T", "Agrave T", "Amacron T", "Aogonek T", "Aring T", "Atilde T", "Aacute Tcaron"],
	["U A", "U Aacute", "U Abreve", "U Acircumflex", "U Adieresis", "U AE", "U Agrave", "U Amacron", "U Aogonek", "Uacute A", "Ucircumflex A", "Udieresis A", "Ugrave A", "Uhungarumlaut A", "Umacron A", "Uogonek A", "Uring A", "Uacute Aacute", "Uring Aacute"],
	["A U", "A Uacute", "A Ucircumflex", "A Udieresis", "A Ugrave", "A Uhungarumlaut", "A Umacron", "A Uogonek", "A Uring", "Aacute U", "Abreve U", "Acircumflex U", "Adieresis U", "Agrave U", "Amacron U", "Aogonek U", "Aacute Uacute", "Aacute Uring"],
	["R V", "Racute V", "Rcaron V", "Rcommaaccent V"],
	["V G", "V Gbreve", "V Gcircumflex", "V Gcommaaccent"],
	["V O", "V Oacute", "V Ocircumflex", "V Odieresis", "V OE", "V Ograve", "V Ohungarumlaut", "V Omacron", "V Oslash", "V Otilde"],
	["Y O", "Y Oacute", "Y Ocircumflex", "Y Odieresis", "Y OE", "Y Ograve", "Y Ohungarumlaut", "Y Omacron", "Y Oslash", "Y Otilde", "Yacute O", "Ydieresis O", "Yacute Oacute"],
	["C A", "C Aacute", "C Abreve", "C Acircumflex", "C Adieresis", "C AE", "C Agrave", "C Amacron", "C Aogonek", "C Aring", "C Atilde", "Cacute A", "Ccaron A", "Ccedilla A", "Ccircumflex A", "Ccaron Aacute"],
	 # Dcaron can not be followed by Y with or without accent in a standard word, but I can
	 # imagine some abbreviation or compound word with this combination
	["D A", "D Aacute", "D Abreve", "D Acircumflex", "D Adieresis", "D AE", "D Agrave", "D Amacron", "D Aogonek", "D Aring", "D Atilde", "Dcaron A", "Dcroat A", "Dcaron Aacute"],
	["D Y", "D Yacute", "D Ydieresis", "Dcaron Y", "Dcroat Y", "Dcaron Yacute"],
	["K O", "K Oacute", "K Ocircumflex", "K Odieresis", "K OE", "K Ograve", "K Ohungarumlaut", "K Omacron", "K Oslash", "K Otilde", "Kcommaaccent O"],
	["L W", "Lcommaaccent W", "Lslash W"],
	# there would be many kerns for O A when using kern classes; the same for A O
	["O A", "O Aacute", "O Abreve", "O Acircumflex", "O Adieresis", "O AE", "O Agrave", "O Amacron", "O Aogonek", "O Aring", "O Atilde", "Oacute A", "Ocircumflex A", "Odieresis A", "Ograve A", "Ohungarumlaut A", "Omacron A", "Oslash A", "Otilde A", "Oacute Aacute"],
	["O V", "Oacute V", "Ocircumflex V", "Odieresis V", "Ohungarumlaut V", "Omacron V", "Oslash V", "Otilde V"],
	["O Y", "O Yacute", "O Ydieresis", "Oacute Y", "Ocircumflex Y", "Odieresis Y", "Ograve Y", "Ohungarumlaut Y", "Omacron Y", "Oslash Y", "Otilde Y", "Oacute Yacute"],
	["R W", "Racute W", "Rcaron W", "Rcommaaccent W"],
	["O X", "Oacute X", "Ocircumflex X", "Odieresis X", "Ograve X", "Ohungarumlaut X", "Omacron X", "Oslash X", "Otilde X"],
	["R T", "R Tcaron", "R uni0162", "R uni021A", "Racute T", "Rcaron T", "Rcommaaccent T", "Rcaron Tcaron"],
	["W O", "W Oacute", "W Ocircumflex", "W Odieresis", "W OE", "W Ograve", "W Ohungarumlaut", "W Omacron", "W Oslash", "W Otilde"],
	["Y S", "Y Scaron", "Yacute S", "Ydieresis S", "Yacute Scaron"],
	["A C", "A Cacute", "A Ccaron", "A Ccedilla", "A Ccircumflex", "Aacute C", "Abreve C", "Acircumflex C", "Adieresis C", "Agrave C", "Amacron C", "Aogonek C", "Aring C", "Atilde C", "Aacute Ccaron"],
	["A G", "A Gbreve", "A Gcircumflex", "A Gcommaaccent", "Aacute G", "Abreve G", "Acircumflex G", "Adieresis G", "Agrave G", "Amacron G", "Aogonek G", "Aring G", "Atilde G"],
	["A O", "A Oacute", "A Ocircumflex", "A Odieresis", "A OE", "A Ograve", "A Ohungarumlaut", "A Omacron", "A Oslash", "A Otilde", "Aacute O", "Abreve O", "Acircumflex O", "Adieresis O", "Agrave O", "Amacron O", "Aogonek O", "Aring O", "Atilde O", "Aacute Oacute"],
	["A Q", "Aacute Q", "Abreve Q", "Acircumflex Q", "Adieresis Q", "Agrave Q", "Amacron Q", "Aogonek Q", "Aring Q", "Atilde Q"],
	["D W", "Dcaron W", "Dcroat W"],
	# problematic kern follows (the kern value of DV was positive in GentiumPlus Regular)
	["D V", "Dcaron V", "Dcroat V"]
    ]
    kernpairsinitialcap = [
	["V a", "V aacute", "V abreve", "V acircumflex", "V adieresis", "V ae", "V agrave", "V amacron", "V aogonek", "V aring", "V atilde"],
	["V e", "V eacute", "V ecaron", "V ecircumflex", "V edieresis", "V edotaccent", "V egrave", "V emacron", "V eogonek"],
	["V o", "V oacute", "V ocircumflex", "V odieresis", "V oe", "V ograve", "V ohungarumlaut", "V omacron", "V oslash", "V otilde"],
	["Y a", "Y aacute", "Y abreve", "Y acircumflex", "Y adieresis", "Y ae", "Y agrave", "Y amacron", "Y aogonek", "Y aring", "Y atilde", "Yacute a", "Ydieresis a", "Yacute aacute"],
	["Y e", "Y eacute", "Y ecaron", "Y ecircumflex", "Y edieresis", "Y edotaccent", "Y egrave", "Y emacron", "Y eogonek", "Yacute e", "Ydieresis e", "Yacute eacute", "Yacute ecaron"],
	["Y o", "Y oacute", "Y ocircumflex", "Y odieresis", "Y oe", "Y ograve", "Y ohungarumlaut", "Y omacron", "Y oslash", "Y otilde", "Yacute o", "Ydieresis o", "Yacute oacute"],
	# not used the combination "Y u" that is only in GentiumPlus regular
	["A v", "Aacute v", "Abreve v", "Acircumflex v", "Adieresis v", "Agrave v", "Amacron v", "Aogonek v", "Aring v", "Atilde v"],
	["A w", "Aacute w", "Abreve w", "Acircumflex w", "Adieresis w", "Agrave w", "Amacron w", "Aogonek w", "Aring w", "Atilde w"],
	["A y", "A yacute", "A ydieresis", "Aacute y", "Abreve y", "Acircumflex y", "Adieresis y", "Agrave y", "Amacron y", "Aogonek y", "Aring y", "Atilde y", "Aacute yacute"],
	["F a", "F aacute", "F abreve", "F acircumflex", "F adieresis", "F ae", "F agrave", "F amacron", "F aogonek", "F aring", "F atilde"],
	["F e", "F eacute", "F ecaron", "F ecircumflex", "F edieresis", "F edotaccent", "F egrave", "F emacron", "F eogonek"],
	["F o", "F oacute", "F ocircumflex", "F odieresis", "F oe", "F ograve", "F ohungarumlaut", "F omacron", "F oslash", "F otilde"],
	["T a", "T aacute", "T abreve", "T acircumflex", "T adieresis", "T ae", "T agrave", "T amacron", "T aogonek", "T aring", "T atilde", "Tcaron a", "uni0162 a", "uni021A a", "Tcaron aacute"],
	["T e", "T eacute", "T ecaron", "T ecircumflex", "T edieresis", "T edotaccent", "T egrave", "T emacron", "T eogonek", "Tcaron e", "uni0162 e", "uni021A e"],
	["T o", "T oacute", "T ocircumflex", "T odieresis", "T oe", "T ograve", "T ohungarumlaut", "T omacron", "T oslash", "T otilde", "Tcaron o", "uni0162 o", "uni021A o", "Tcaron oacute"],
	["W a", "W aacute", "W abreve", "W acircumflex", "W adieresis", "W ae", "W agrave", "W amacron", "W aogonek", "W aring", "W atilde"],
	["W e", "W eacute", "W ecaron", "W ecircumflex", "W edieresis", "W edotaccent", "W egrave", "W emacron", "W eogonek"],
	["W o", "W oacute", "W ocircumflex", "W odieresis", "W oe", "W ograve", "W ohungarumlaut", "W omacron", "W oslash", "W otilde"]
    ]
    kernpairssmall = [
	["v e", "v eacute", "v ecaron", "v ecircumflex", "v edieresis", "v edotaccent", "v egrave", "v emacron", "v eogonek"],
	["k e", "k eacute", "k ecaron", "k ecircumflex", "k edieresis", "k edotaccent", "k egrave", "k emacron", "k eogonek", "kcommaaccent e"],
	["o v", "oacute v", "ocircumflex v", "odieresis v", "ograve v", "oslash v", "otilde v"],
	["o x", "oacute x", "ocircumflex x", "odieresis x", "ograve x", "oslash x", "otilde x"],
	["v a", "v aacute", "v abreve", "v acircumflex", "v adieresis", "v ae", "v agrave", "v amacron", "v aogonek", "v aring", "v atilde"],
	["v o", "v oacute", "v ocircumflex", "v odieresis", "v oe", "v ograve", "v ohungarumlaut", "v omacron", "v oslash", "v otilde"],
	["r a", "r aacute", "r abreve", "r acircumflex", "r adieresis", "r ae", "r agrave", "r amacron", "r aogonek", "r aring", "r atilde", "racute a", "rcaron a", "rcommaaccent a", "rcaron aacute"],
	["r e", "r eacute", "r ecaron", "r edieresis", "r edotaccent", "r egrave", "r emacron", "r eogonek", "racute e", "rcaron e", "rcommaaccent e", "rcaron eacute"],
	["r c", "r cacute", "r ccaron", "r ccedilla", "r cdotaccent", "racute c", "rcaron c", "rcommaaccent c", "rcaron ccaron"],
	["r q", "racute q", "rcaron q", "rcommaaccent q"],
	["y e", "y eacute", "y ecaron", "y ecircumflex", "y edieresis", "y edotaccent", "y egrave", "y emacron", "y eogonek", "yacute e", "ydieresis e", "yacute eacute"],
	["y o", "y oacute", "y ocircumflex", "y odieresis", "y oe", "y ograve", "y ohungarumlaut", "y omacron", "y oslash", "y otilde", "yacute o", "ydieresis o", "yacute oacute"],
	["a v", "aacute v", "abreve v", "acircumflex v", "adieresis v", "agrave v", "amacron v", "aogonek v", "aring v", "atilde v"],
	["a w", "aacute w", "abreve w", "acircumflex w", "adieresis w", "agrave w", "amacron w", "aogonek w", "aring w", "atilde w"],
	["c h", "cacute h", "ccaron h", "ccedilla h", "cdotaccent h"],
	["c k", "cacute k", "ccaron k", "ccedilla k", "cdotaccent k"],
	["e x", "eacute x", "ecaron x", "ecircumflex x", "edieresis x", "edotaccent x", "egrave x", "emacron x", "eogonek x"],
	["o w", "oacute w", "ocircumflex w", "odieresis w", "ograve w", "oslash w", "otilde w"],
	["r o", "r oacute", "r ocircumflex", "r odieresis", "r oe", "r ograve", "r ohungarumlaut", "r omacron", "r oslash", "r otilde", "racute o", "rcaron o", "rcommaaccent o", "rcaron oacute"],
	["x e", "x eacute", "x ecaron", "x ecircumflex", "x edieresis", "x edotaccent", "x egrave", "x emacron", "x eogonek"],
	["y a", "y aacute", "y abreve", "y acircumflex", "y adieresis", "y ae", "y agrave", "y amacron", "y aogonek", "y aring", "y atilde", "yacute a", "ydieresis a", "yacute aacute"],
	["r d", "r dcaron", "r dcroat", "racute d", "rcaron d", "rcommaaccent d", "rcaron dcaron"]
    ]
    kernpairsquotes = [
	# this is far from complete
	# TODO: use this list also for accented small caps (using kernfactor)
	["A quotedblright", "A quotedblleft", "Aacute quotedblleft", "Adieresis quotedblleft"],
	["L quotedblright", "L quotedblleft"], # Lcaron and Lacute left out (collision)
	["A quoteright", "A quoteleft", "Aacute quoteleft", "Adieresis quoteleft"],
	["L quoteright", "L quoteleft"], # Lcaron and Lacute left out (collision)
	# the following groups look like a nonsense, but all this actually tries to follow the
	# idea of correcting just the most critical letters and giving them the same kern value
	["A quotedblright", "quotedblbase V", "quotedblbase W", "quotedblbase Y", "quotedblbase Yacute", "quotedblbase T", "quotedblbase Tcaron"],
	["A quoteright", "quotesinglbase V", "quotesinglbase W", "quotesinglbase Y", "quotesinglbase Yacute", "quotesinglbase T", "quotesinglbase Tcaron"]
    ]
    rightpunctuationsmall = [
	["r comma", "racute comma", "rcaron comma", "rcommaaccent comma"],
	["y comma", "yacute comma", "ydieresis comma"],
	["r period", "racute period", "rcaron period", "rcommaaccent period"],
	["y period", "yacute period", "ydieresis period"]
	# nothing to be derived from "f quoteright" and "f quotedblright"
    ]
    def __init__(self, filename):
        self.f = open(filename, "a") # append
    def writetofile(self, s):
	# This method writes one extra kerning pair to the output file.
	# It also makes correction for small cap Tcommaaccent and Tcedilla.
	# Tcedilla is uni0162 and the small cap is uni0163.SC, not
	# uni0162.SC. Tcommaaccent is uni021A and the small cap is uni021B.SC,
	# not uni021a.SC (look also at the small "a"; there is problem not only
	# in the unicode value, but also in the case, because method lower() is
	# used).
	self.f.write(s.replace("uni021a.SC", "uni021B.SC").replace("uni0162.SC", "uni0163.SC"))
    def smallcaps(self, fromreader, kernfactor):
	a = fromreader.getkerns("KPX [A-Z] [A-Z]")
	for s in a:
	    parts = s.split()
	    self.writetofile("KPX " + parts[1].lower() + ".SC " + parts[2].lower() +
			 ".SC " + str(int(round(kernfactor * float(parts[3])))) +
			 '\n')
    def initialcap(self, fromreader, kernfactor):
	a = fromreader.getkerns("KPX [A-Z] [A-Z]")
	for s in a:
	    parts = s.split()
	    self.writetofile("KPX " + parts[1] + " " + parts[2].lower() + ".SC " +
			 str(int(round(kernfactor * float(parts[3])))) + '\n')
    def rightpunctuation(self, fromreader, kernfactor):
	# small cap and punctuation
	a =      fromreader.getkerns("KPX [A-Z] period")
	a.extend(fromreader.getkerns("KPX [A-Z] comma"))
	a.extend(fromreader.getkerns("KPX [A-Z] quotedblright"))
	a.extend(fromreader.getkerns("KPX [A-Z] quoteright"))
	for s in a:
	    parts = s.split()
	    self.writetofile("KPX " + parts[1].lower() + ".SC " + parts[2] + " " +
			 str(int(round(kernfactor * float(parts[3])))) + '\n')
    def leftpunctuation(self, fromreader, kernfactor):
	# punctuation and small cap
	a =      fromreader.getkerns("KPX quotedblleft [A-Z]")
	a.extend(fromreader.getkerns("KPX quoteleft [A-Z]"))
	for s in a:
	    parts = s.split()
	    self.writetofile("KPX " + parts[1] + " " + parts[2].lower() + ".SC " +
			 str(int(round(kernfactor * float(parts[3])))) + '\n')
    def accentedcapitalletters(self, fromreader):
	for x in self.kernpairscapital:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		self.writetofile(newkernline)
    def accentedsmallletters(self, fromreader):
	for x in self.kernpairssmall:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		self.writetofile(newkernline)
    def accentedsmallcaps(self, fromreader, kernfactor):
	for x in self.kernpairscapital:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		parts = newkernline.split()
		self.writetofile("KPX " + parts[1].lower() + ".SC " + parts[2].lower() +
			     ".SC " + str(int(round(kernfactor * float(parts[3])))) +
			     '\n')
    def accentedinitialcap(self, fromreader):
	for x in self.kernpairsinitialcap:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		self.writetofile(newkernline)
    def accentedinitialcapsmallcap(self, fromreader, kernfactor):
	for x in self.kernpairscapital:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		parts = newkernline.split()
		self.writetofile("KPX " + parts[1] + " " + parts[2].lower() + ".SC " +
			     str(int(round(kernfactor * float(parts[3])))) + '\n')
    def accentedrightpunctuation(self, fromreader):
	for x in self.rightpunctuationsmall:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		self.writetofile(newkernline)
    def accentedleftpunctuation(self, fromreader):
	# nothing to be done
	pass
    def czechquotes(self, fromreader):
	for x in self.kernpairsquotes:
	    basekern = x[0]
	    derivedkerns = x[1:]
	    a = fromreader.getkerns("KPX " + basekern + " ")
	    kernline = a[0]
	    for b in derivedkerns:
		newkernline = kernline.replace(basekern, b)
		self.writetofile(newkernline)
    def close(self):
	self.f.close()


kernfactor = 0.94 # width of small caps / width of capital letters; tested for
    # letters A, L, T, V, W and Y, all had nearly the same ratio

fin = KernReader(sys.argv[1])

fout = KernWriter(sys.argv[2])
# letters without accents
fout.smallcaps(fin, kernfactor)
fout.initialcap(fin, kernfactor)
fout.rightpunctuation(fin, kernfactor)
fout.leftpunctuation(fin, kernfactor)
# letters with accents
fout.accentedcapitalletters(fin)
fout.accentedsmallletters(fin)
fout.accentedsmallcaps(fin, kernfactor)
fout.accentedinitialcap(fin)
fout.accentedinitialcapsmallcap(fin, kernfactor)
fout.accentedrightpunctuation(fin)
fout.accentedleftpunctuation(fin)
fout.czechquotes(fin)
fout.close()
