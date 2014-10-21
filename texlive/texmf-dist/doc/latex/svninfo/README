
			`svninfo'

		version 0.7.4, March 23, 2010

This package is used to extract the revision and file information provided
by the subversion revision control system.

Copyright (C) 2003-2010 Achim D. Brucker
email: brucker@member.fsf.org 

License:
   This program can be redistributed and/or modified under the terms
   of the LaTeX Project Public License Distributed from CTAN
   archives in directory macros/latex/base/lppl.txt; either
   version 1 of the License, or any later version.

You are allowed to distribute this file under the condition that it is
distributed together with all the following files:
   svninfo.ins
   svninfo.dtx
   Makefile
   README

If you receive only some of these files from someone, complain!

To install:
  unpack and
  `make'
or execute the commands manually:
  latex svninfo.ins     // creates the file of this package
  latex svninfo.dtx     // create the package documentation

The following files are created by 'latex svninfo.ins'
	- svninfo.cfg
	- svninfo.sty
	- svninfo.perl
	- svninfo.init

then copy the files
  svninfo.sty
  svninfo.cfg
to a place where LaTeX can find it
  (e.g. under UNIX: $HOME/tex/inputs
   and set the environment variable
	TEXINPUTS=$HOME/tex/inputs//:$TEXINPUTS
  )

============================================================================

HISTORY
0.7.4 : Fixed localization of date formats, e.g., \svnToday.
0.7.3 : Fixed bug resulting in wrong date for maximal 
        revision (\svnInfoMaxToday).
0.7.2 : Fixed documentation: the option for using scrpage2 package is called 
        scrpage. Fixed support for svk.
0.7.1 : Fixed \svnMaxToday and introduced \svnInfoMaxToday as an alternative
        name. Improved documentation
0.7   : Added option margin for showing version info in the margins of the 
        document; added option svk for supporting the keyword expansion of svk; 
	added new command \svnMaxToday; and fixed the use of fancyhdr for 
	single-sided documents.
0.6   : Added \svnInfoMinRevision and \svnInfoMaxRevision together with the  
        option "revrange". Also added support for \ in keywords.
0.5   : Removed support for LaTeX2HTML and added new command \svnKeyword
 	  for defining arbitrary svn keywords (e.g. $Author:$).
0.4   : Added new package options draft, final, eso-foot, and scrpage. Fixed 
          problem with `\_' in file names.
0.3   : Added support for Id-keywords without owner information 
          (fixes a bug reported by Uwe Ziegenhagen).
0.2.1 : Added \svnId (suggested by Thomas Weber).
0.2   : Removed latex2html build-dependency 
0.1   : Initial Version, based on rcsinfo from Dr. Juergen Vollmer
