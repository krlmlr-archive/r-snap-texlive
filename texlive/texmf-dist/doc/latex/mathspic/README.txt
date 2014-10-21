%% readme.txt
%% for mathsPIC (version 1.13)

Name:-         mathsPIC (Perl version)
Authors:-      A. Syropoulos (asyropoulos@yahoo.com) 
               and R.W.D. Nickalls (dick@nickalls.org)
Date:-         April 26, 2010

(1) INTRODUCTION
-----------------
MathsPIC is an open-source `filter' program for the PiCTeX graphics package, which enables complicated drawings/diagrams to be constructed very easily (allows the flexible use of LaTeX commands, relative addressing, macros, libraries, and perl programs).

MathsPIC is a Perl program which processes an input script file (containing mathsPIC, TeX, LaTeX, and PiCTeX commands) into  a .tex file which can be processed in the usual way (by TeX or LaTeX) to  generate the final graphic. Please read the comprehensive manual for details of commands, usage, examples, installation etc.

MathsPIC will run on any platform having a working Perl and TeX/LaTeX installation. However, there may of course be minor differences regarding installation and usage between platforms.

MathsPIC has been well tested using a Solaris x86 box and GNU/Linux which the authors are familiar with. Feedback regarding installation and usage on other platforms will be greatly appreciated, and included in future manuals.

For details see the manual (mp1manual*.pdf).

(2) HISTORY
-----------
MathsPIC was originally an MS-DOS program (September 1999). mathsPIC was implemented in Perl in order to (a) greatly improve its utility, and (b) to make it available to the wide range of platforms which run Perl. An early version of the Perl mathsPIC was presented at the TUG2000 conference (Oxford, UK).

(3) REQUIRED SYSTEMS
--------------------
-perl (an interpreter for the perl language, see http://www.perl.com)


(4) PACKAGE FILES
------------------
The following files are included in the mathsPIC package.


grabtexdata.pl        % Perl program used in Chapter 8 (Accessing TeX parameters)
HELP.TXT              % text version of the Unix manpage
mathspic113.pl        % mathsPIC program version 1.13 (perl)
mathspic.sty          % style option
mathspic.1            % unix/Linux manpage file
mathspic.sh           % example BASH file for running the program
MATHSPIC.BAT          % example batch file (MS-Windows)
mathsPICmanual.pdf    % manual 
mathsPICmanual.zip    % manual--all the LaTeX and figure files
mathsPICfigures.zip   % all the .m and .pl files described in the manual
mathspic.lib          % example library file of macros
README.txt            % this file
sourcecode.pdf        % source code
sourcecode.html       % source code
sourcecode.nw         % source code (noweb)



(5) INSTALLATION (Unix/Linux)
-----------------------------
Four files need to be placed in specific locations as follows
(see also USAGE regarding the BASH script file)

(a) mathsPIC program (mathspic113.pl)
This needs to be placed where your shell can find it
(typically: /usr/local/bin)

(b) mathsPIC BASH script (mathspic.sh)
This needs to be placed where your shell can find it
(typically: /usr/local/bin)

(c) LaTeX package (mathspic.sty)
This needs to be  placed with the other style options
(typically:  /usr/share/texmf/tex/latex/base/).

(d) manpage (mathspic.1)
place this file in the /man1/ directory
(typically:  /usr/share/man/man1/)

An alternative to using the shell script (BASH file) is simply to  make the 
perl script file (mathspic.pl) `executable', as follows: 
Just copy the file mathspic.pl to a directory where the  shell
can find it (typically /usr/local/bin)  and then
 (1) rename the file -->  mathspic.
 (2) make the file `executable' (e.g., by issuing the command  <chmod 755 mathspic> ).


(6) USAGE  (see manual for full details)
----------------------------------------
In Unix/Linux one way of running mathsPIC is to type the following at the command-line (options are shown in square brackets). Note this requires both the perl program (mathspic.pl) and the input file to be in the same directory.

Syntax:
   perl mathspic113.pl [-b] [-c] [-h]  infile  [-o outfile]

Options:
 -b       enables bell/sound if errors are detected
 -c       disables writing of comments to output file
 -o       to be followed by the <outfile>
 -h       displays help info

However, it is generally much more convenient to run mathsPIC via a batch file, since we can then run mathsPIC from any directory.

For example (Unix/Linux) rename the example BASH file <mathspic.sh> to <mathspic>. Now change the user permissions to make it a read/write/executable  file ($ chmod 755 mathspic). Finally, copy the file to a place where your shell will find it, typically the directory  /usr/local/bin/.  Now you will be able to run mathsPIC from the command-line in any directory using the command:-

mathspic  [-b] [-c] [-h]  infile  [-o outfile]

MS-Windows users can use the example MATHSPIC.BAT file similarly.

(7) LICENSE (LPPL):
-------------
 This program is free software; you can redistribute it and/or modify it under the terms of the LaTeX Project Public License.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-----------------
End of README.txt
-----------------



=========================

