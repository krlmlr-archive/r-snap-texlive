
This is file `00readme.txt'.
(Start your first tour of the C.D.P. Bundle by reading this file.)

This file is part of a work named "C.D.P. Bundle".

Copyright (C) 1999-2006 by Gustavo MEZZETTI <mezzetti@math.unipd.it>.

The C.D.P. Bundle may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2003/12/01 or later.

The C.D.P. Bundle has the LPPL maintenance status
  "author-maintained".

The file `manifest.txt' that comes along with this file specifies
what the C.D.P. Bundle consists of; more precisely, it explains how
the locutions "Work" and "Compiled Work", used in the LaTeX Project
Public License, are to be interpreted in the case of this work.

This file, after giving a brief description of the C.D.P. Bundle,
explains how to install it and how to generate its--alas, still
incomplete!--documentation.

January 1, 2006 (vers. 0.34)



CONTENTS
========

- A dozen lines description of the software
- Drawbacks
- Installation in a snapshot
- Checking the contents of the distribution
- How to install the C.D.P. Bundle
- How to generate the documentation



A DOZEN LINES DESCRIPTION OF THE SOFTWARE
=========================================

The C.D.P. Bundle was originally developed for a free association named 
"C.D.P." (more on it in the documentation), to typeset its official letters 
with the appropriate letterhead; but more generally, it can be used to 
typeset high-quality business letters formatted according to Italian style 
conventions.  It is highly configurable, and its modular structure provides 
you with building blocks of increasing level, by means of which you can 
compose practically every kind of business letter you could need (including 
anglo-saxon ones!).  It is also possible to write letters divided into 
sections and paragraphs, to include floating figures and tables, and to use 
the commands "\tableofcontents", "\listoffigures", and "\listoftables" to 
compile the relevant indexes.  A single input file can contain several 
letters, and each letter will have its own table of contents, etc., 
independent from the other ones.



DRAWBACKS
=========

The documentation included in this distribution is absolutely minimal.  For 
meaningful instructions on how to use the macros, the reader is referred to 
other documents available at the web site of the author's department, 
which, however, are written in Italian.  Since the main purpose of these 
macros is to typeset letters according to Italian conventions, this should 
not be a problem.  I will consider translating the documentation in English 
only if at least 5 persons ask me to.



INSTALLATION IN A SNAPSHOT
==========================

The C.D.P. Bundle is distributed in the usual .dtx + .ins format.  The main 
file is `cdpbundl.dtx', with installation script `cdpbundl.ins'.  Do the 
usual things to install it and to generate the documentation.  If you don't 
know what the usual things are, read below.  Note that in order to generate 
the documentation you should do the following:

latex; latex; makeindex (.idx); makeindex (.glo); latex; latex.



CHECKING THE CONTENTS OF THE DISTRIBUTION
=========================================

Before installing the C.D.P. Bundle and generating its documentation, it is 
a good idea to read the file `manifest.txt', which lists all the files that 
make up the distribution, to check that you don't lack any of them (in 
particular, that you have the file `manifest.txt' itself!).  If you do find 
that some files are missing, don't hesitate to complain to the distributor 
from whom you obtained the others: this person, company, or institution is 
infringing the copyright (actually, the copyleft) of the C.D.P. Bundle.  
Please remember, however, that in order to comply with the copyright a 
distributor is only requested to supply the files listed in `manifest.txt' 
under the title "MEANING OF THE TERM `Work'", but not those listed under 
"MEANING OF THE TERM `Compiled Work'".



HOW TO INSTALL THE C.D.P. BUNDLE
================================

To install the C.D.P. Bundle, follow these steps:

1) Make sure that the files `cdpbundl.dtx' and `cdpbundl.ins' are placed in 
the same directory; below, we shall indicate this directory as "the current 
directory".

2) Run LaTeX (or Plain TeX) once on the file `cdpbundl.ins'.  This will 
generate, in the current directory, the following LaTeX input files:

    adiseal.sty
    articoletteracdp.cls
    cdpaddon.sty
    cdpshues-example.def
    cdpshues.cfg
    epson-stylus-740.def
    hp-laserjet-4500.def
    lettcdpadi.cls
    letteracdp.cls

3) Move all the files listed in 2) from the current directory to a LaTeX 
input directory--see b) and c) below.

4) If you wish, delete the file `cdpbundl.log' to save disk space.

Installation is now finished!  The following comments may be useful:

a) The above listing of all the files you need to move is also displayed on 
the terminal at the end of the run of the file `cdpbundl.ins'.

b) The documentation of your TeX installation should tell you how to find 
the LaTeX input directory/ies, and probably also how to create new LaTeX 
input directories reserved to hold your private classes and packages.  If 
your TeX installation offers you the chance of defining your private LaTeX 
input directories, I recommend you exploit this possibility and place the 
generated files into such a directory.

c) If you are not able to find the LaTeX input directories, or you are not 
allowed to modify them and cannot create your personal LaTeX input 
directories, do this: place all the files listed under 2) above in any 
directory of your choice (a newly created, empty directory would be the 
best choice, however); then put all the LaTeX source files that you want to 
typeset using the C.D.P. Bundle in that same directory.  Of course, this 
solution becomes impractical if the number of such source files exceeds a 
dozen or so; but for a few files you can do this way, at least until you 
decide to finally learn how to create your private LaTeX input directories!  
:-)

d) You may also choose to install the C.D.P. Bundle inside the main texmf 
tree of your TeX installation (as opposed to installing it inside a 
directory devoted to private classes and packages).  In this case, note 
that the TDS-compliant location for the C.D.P. Bundle, that is, the 
directory inside which you should put all the files listed in 2), is

    $TEXMF/tex/latex/cdpbundl/
    
The documentation, on the other hand, should be stored inside

    $TEXMF/doc/latex/cdpbundl/

Of course, in order to do so you must have appropriate access priviledges 
to the texmf tree of your site.



HOW TO GENERATE THE DOCUMENTATION
=================================

A shortened form of the documentation, already typeset and packaged in PDF 
format, is given in the file `overview.pdf' that you might have found on 
some sites (e.g., the CTAN sites).  This file, however, is not part of the 
C.D.P. Bundle and distributors are not requested to include it among the 
distributed files.  Moreover, it does not contain any implementation notes 
(in which most users are not at all interested).

If the distributor from whom you obtained the C.D.P. Bundle did not provide 
the file `overview.pdf', or if you want the full documentation, complete 
with all the available implementation notes (but, alas, still incomplete 
for many respects), you can generate it by following these steps:

1) Run LaTeX (_not_ Plain TeX) _twice_ on the file `cdpbundl.dtx'.
This, among other things, will generate the files `cdpbundl.idx' and 
`cdpbundl.glo' in the same directory as the file `cdpbundl.dtx'.

2) Run MakeIndex on the file `cdpbundl.idx' obtained in 1), using the style 
file `gind.sty', which is part of the standard LaTeX distribution.

3) Run MakeIndex on the file `cdpbundl.glo' obtained in 1), using the style 
file `gglo.sty', which is part of the standard LaTeX distribution.

4) Run LaTeX _two_ more times on the file `cdpbundl.dtx'.

5) If you wish, you can now delete the following files, to save disk space:

    cdpbundl.aux
    cdpbundl.glo
    cdpbundl.gls
    cdpbundl.idx
    cdpbundl.ilg
    cdpbundl.ind
    cdpbundl.lof
    cdpbundl.log
    cdpbundl.toc

After step 4), you should get the documentation in DVI format in the file 
`cdpbundl.dvi', located in the same directory as `cdpbundl.dtx', with all 
indexes, table of contents, etc. correctly set.

However, if you are neurotic (as I am) and have a fast computer, you could 
run LaTeX three or four times, instead of two, in step 1)...  :-)

Other LaTeX typesetting engines should work in the same way, perhaps 
producing the output in a different format; for example, you may use 
pdflatex in place of LaTeX to obtain the documentation in PDF format.



Have fun with the C.D.P. Bundle!

