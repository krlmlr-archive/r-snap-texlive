Sie finden eine deutsche Version dieses Textes in LIESMICH!

pdfcprot bundle
===============

Redistribution of this bundle is allowed provided that all files that
make up the pdfcprot bundle are contained.  The list of all files
making up this bundle is given below.

This bundle has been created for the use with LaTeX2e and pdftex. 
Although a great effort has been made to eliminate all bugs, this bundle 
is provided `as is' without warranty of any kind, either expressed or
implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose.  The entire risk
as to the quality and performance of the program is with you.


The files:
----------

All files marked with an exclamation mark (!) are REQUIRED as a part
of the distribution. You are NOT ALLOWED to distribute them
separately, any distribution MUST contain ALL of the required
files. All unmarked files are OPTIONAL parts of the distribution. You
may leave them out but you MUST NOT redistribute them without
including the REQUIRED files.

 ! pdfcprot.ins  - Install file for the pdfcprot bundle
 ! pdfcprot.dtx  - contains:
    pdfcprot.sty  - pdfcprot package to activate character protruding
    pplmnT1.cpa   - adjustment file for character protruding for
                    the Palatino font in T1 encoding
    pplmnOT1.cpa   - adjustment file for character protruding for
                    the Palatino font in OT1 encoding
    pplmnTS1.cpa   - adjustment file for character protruding for
                    the Palatino font in TS1 encoding
    pplmnT2A.cpa   - adjustment file for character protruding for
                    the Palatino font in T2A encoding
    pplmnOT2.cpa   - adjustment file for character protruding for
                    the Palatino font in OT2 encoding
 ! README.txt    - you are just reading it.
 ! INSTALL.txt	 - the installation manual
 ! LEGAL.txt	 - the dry part: legal stuff, warranty, license
 ! TODO

 If one or more of the above files marked with an exclamation mark (!)
 is missing, please inform the author about the missing files and
 where you have gotten the bundle from.

          E-Mail: Tobias Schlemmer <keinstein_junior@gmx.net>

 Please send me a private message, as I read de.comp.text.tex very
 irregulary. From Version 1.7 I'll do the support.

 Original Author:

	  E-Mail:  Carsten.Schurig@gmx.net

 Unfortunatly I don't have the time to read usenet so you won't reach
 me in de.comp.text.tex, but if you're member of TEX-D-L, you may
 contact me there.

Installation:
-------------

The following describes the general procedure for installing this
bundle. If you have a TeX system compatible to TDS (most of the newer
TeX systems are), please read INSTALL.TXT.

  Copy all files to a directory, where TeX/LaTeX can find them.
  Run pdfcprot.ins through LaTeX, e.g. at UNIX type:
    tex "&latex" pdfcprot.ins
  or
    latex pdfcprot.ins
  You'll get a a new sty- and cpa-file. Copy them to
  the corresponding LaTeX-directory. See INSTALL.TXT for further
  information.
  Do not forget to run the initialization procedures specific to your
  TeX distribution, e.g. if you use teTeX, run 'texhash'

  If you want the documentation for the package (highly RECOMMENDED)
  including the implementation, you have to run the dtx-files through 
  LaTeX. Again, using a UNIX system
  type: 
    tex "&latex" pdfcprot.dtx
  or
    latex pdfcprot.dtx
 
  Do that three times to get correct references and table of contents
.
  To get an index run:
    makeindex -s gind.ist  pdfcprot
    makeindex -s gglo.ist -o pdfcprot.gls pdfcprot.glo

  And after run again latex (once should be sufficient).

Bug-reports:
------------
  To report a bug, run just mail me.