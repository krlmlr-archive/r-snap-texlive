ALLRUNES
  The allrunes package is a set of fonts and a LaTeX package
  for writing runes of all kinds using LaTeX.

AUTHOR AND HOMEPAGE
  Carl-Gustav Werner is the author of allrunes.
  More information can be found at
  http://www.maths.lth.se/~carl/allrunes/

COPYRIGHT
  This program is provided under the terms of the
  LaTeX Project Public License distributed from CTAN
  archives in the directory macros/latex/base/lppl.txt.
  (C) 2001-2004 Carl-Gustav Werner

VERSION
  This README.txt describes the allrunes version 2.1

CHANGES
  1.0  First public release.
  1.01 Removed a few remaining 8-bit characters from
       frum.mf. They didn't work with the new MiKTeX
       package handling system. Also added a lost table,
       added an example and corrected a few spelling
       mistakes in the documentation.
  2.0  Added type1 versions for the main types of the
       allrunes fonts, and support for them in the LaTeX package.
       Merged the former Scandinavian-Gothic and the Continental
       font families to a Common Germanic font family. Renamed the
       commands for flipping and turning runes. Made the commands
       for flipping and turning runes work for all six font families.
       Inserted kerning information for the Common Germanic and
       Anglo-Frisian font families. Complemented the sets of runes
       with a few more, especially the Medieval one. Corrected many
       spelling mistakes in the documentation.
  2.1  Modified the handling of type1 fontes to take advantage
       of the new map-file handling system of MiKTeX- and teTeX-
       implementations. Removed a bug that prevented the use of
       medieval rune with straight twigs. Minor updates to the
       documentation.

FILES AND DIRECTORIES AT CTAN
  README.txt     This file.
  allrunes.dtx   The source for the allrunes Metafont fonts and
                 LaTeX package.
  allrunes.ins   Driver file for allrunes.dtx
  allrunes.ps    PostScript version of the documentation,
                 using only mf (pk) fonts.
  allrunes.pdf   Pdf version of the documentation,
                 using only type1 fonts.
  type1          Directory for the type1 fonts, containing:
    pfb          Directory for the pfb files
    allrunes.map Map file for mapping the type1 file names

REQUIREMENTS
  The installation of the allrunes package requires the docstrip
  package. Using the allrunes package requires the ifthen package.
  Processing the documentation for the allrunes package requires
  the fontenc package and the ec fonts. I do not know what version
  of LaTeX is required.

INSTALLATION (OF THE LATEX PACKAGE AND THE METAFONT SOURCE FILES)
  The installation procedure is described in the documentation, but
  since there is weak catch 22, in that you might need the fonts to
  produce the documentation, and you might need the documentation to
  install the fonts, it's also described here. The descriptions below
  are intended to be correct for MiKTeX version 2.3 and 2.4, and for
  teTeX version 2.0.

  1. Download the files allrunes.ins and allrunes.dtx to a preferably
     empty directory. If you intend to keep the documentation, you'd
     better create a suitable directory and put the files there right
     now; like
       <tex doc base>/fonts/allrunes/
     In a typical MiKTeX system it would be
       C:\texmf\doc\fonts\allrunes\
     In a teTeX system it might be like
       /usr/local/teTeX/share/texmf/doc/fonts/allrunes/
  2. Start a window where you can enter commands from the keyboard,
     i.e. get an DOS prompt on a Windows machine or a xterm-window
     on a UNIX/linux machine.
  3. Go to the directory where you did put the files allrunes.dtx
     and allrunes.ins
  4. Run the command
       latex allrunes.ins
     Wait. There are 231 files to be generated.
  5. Move all the 224 *.mf files to a suitable directory, preferably
       <font source base>/public/allrunes/
     which in a typical MiKTeX system would be
       C:\texmf\fonts\source\public\allrunes\
     In a teTeX system it might be like
       /usr/local/teTeX/share/texmf/fonts/source/public/allrunes/
  6. Move the 6 *.fd files and the file allrunes.sty
     to a suitable directory, preferably
       <tex base>/tex/latex/allrunes/
     which in a typical MiKTeX system would be
       C:\texmf\tex\latex\allrunes\
     In a typical teTeX system it would be like
       /usr/local/teTeX/share/texmf/tex/latex/allrunes/
  7. Refresh the file name database. In MiKTeX you would run
     the command
       initexmf -u
     or find it somewhere in Start|Program|MiKTeX...
     In teTeX you would just run
       texhash
     or use the configuration tool
       texconfig
     and find some suitable alternative.
  8. Run the command
       latex allrunes.dtx
     to produce the documentation and test the installation.
     Run it one more time to resolve the references, before
     you view it.

INSTALLATION (OF THE TYPE1 FONT FILES)

     Installation of the type1 fonts requires the allrunes package
     to be installed according to the above description. Be sure
     that both LaTeX and dvips works fine with the Metafont
     fonts before you install the type1 fonts.

  1. Copy all the files (named fru??.pfb) from the type1/pfb
     directory to a suitable directory, preferably
       <type1 font base>/public/allrunes
     which in a typical MiKTeX system would be
       C:\texmf\fonts\type1\public\allrunes\
     and in a teTeX system it might be like
       /usr/local/teTeX/share/texmf/fonts/type1/public/allrunes/
  2. Copy the file allrunes.map from the type1 directory
     to some suitable directory, like
       <dvips base>/allrunes
     which in a typical MiKTeX system would be
       C:\texmf\dvips\allrunes\
     and in a teTeX system it might be like
       /usr/local/teTeX/share/texmf/dvips/allrunes/
  3. Edit the file
       <texmf base>/web2c/updmap.cfg
     which in a typical MiKTeX system would be
       C:\texmf\web2c\updmap.cfg
     and in a teTeX system it might be like
       /usr/local/teTeX/share/texmf/web2c/updmap.cfg
     search for a line like:
       MixedMap allrunes.map
     in the file. If the line is not present, then add that line.
  4. Refresh the file name database, see paragraph 7 above.
  5. Update the other .map files. In MiKTeX you run
       initexmf -v --mkmap
     and in teTeX you run
       updmap
  6. Run 
       latex allrunes.dtx
     then try both
        dvips -Ppk allrunes
     (which will use the bitmapped pk fonts) and
        dvips -Poutline allrunes
     (which will use the ouline type1 fonts). You might also try
        pdflatex allrunes.dtx

