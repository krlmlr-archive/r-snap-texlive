REM @echo OFF
Setlocal ENABLEEXTENSIONS

REM Set TeXLive or MiKTeX path
REM Set PATH=I:\TexLive\2011\bin\win32;%PATH%

REM Uses latexmk, which requires perl.

latexmk -jobname=rm001 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{default}\newcommand\TFTESTdebug{true}\input{%%S}" typeface-test
latexmk -jobname=rm002 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{default}\newcommand\TFTESTfontencoding{OT1}\input{%%S}" typeface-test
latexmk -jobname=rm003 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{garamond}\newcommand\TFTESTdebug{true}\newcommand\TFTESTtextfigures{kpfonts:spacing:-30}\newcommand\TFTESTsanstypeface{bera}\newcommand\TFTESTmonotypeface{luxi}\newcommand\TFTESTmathtypeface{mathdesign:charter:greekuppercase:upright}\newcommand\TFTESTsymbolstypeface{default}\input{%%S}" typeface-test
latexmk -jobname=rm004 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{garamond}\newcommand\TFTESTdebug{true}\newcommand\TFTESTtextfigures{kpfonts:scale:1}\newcommand\TFTESTsanstypeface{bera:scale:1}\newcommand\TFTESTmonotypeface{luxi:scale:1}\newcommand\TFTESTmathtypeface{mathdesign:charter:greekuppercase:upright:scale:1}\newcommand\TFTESTsymbolstypeface{default}\input{%%S}" typeface-test
latexmk -jobname=rm005 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfbaskervald}\input{%%S}" typeface-test
latexmk -jobname=rm006 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfbaskervald:lig}\input{%%S}" typeface-test
latexmk -jobname=rm007 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfberenis}\input{%%S}" typeface-test
latexmk -jobname=rm008 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfberenis:lig:tab}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{gfsdidot}\input{%%S}" typeface-test
latexmk -jobname=rm009 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfelectrum}\input{%%S}" typeface-test
latexmk -jobname=rm010 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfelectrum:lig}\newcommand\TFTESTtextfigures{osf}\input{%%S}" typeface-test
latexmk -jobname=rm011 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfromande}\input{%%S}" typeface-test
latexmk -jobname=rm012 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfromande:alt}\input{%%S}" typeface-test
latexmk -jobname=rm013 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfventuris}\input{%%S}" typeface-test
latexmk -jobname=rm014 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfventuris:2}\newcommand\TFTESTmathtypeface{fourier}\input{%%S}" typeface-test
latexmk -jobname=rm015 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adfventuris:old}\input{%%S}" typeface-test
latexmk -jobname=rm016 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{ae}\newcommand\TFTESTmathtypeface{euler}\input{%%S}" typeface-test
latexmk -jobname=rm017 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{antpol}\newcommand\TFTESTmathtypeface{anttor}\input{%%S}" typeface-test
latexmk -jobname=rm018 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{antpol:light}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{iwona:light}\input{%%S}" typeface-test
latexmk -jobname=rm019 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{anttor}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{euler}\input{%%S}" typeface-test
latexmk -jobname=rm020 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{anttor:light}\newcommand\TFTESTmathtypeface{anttor}\input{%%S}" typeface-test
latexmk -jobname=rm021 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{anttor:light}\newcommand\TFTESTmathtypeface{anttor:condensed}\input{%%S}" typeface-test
latexmk -jobname=rm022 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{augie}\input{%%S}" typeface-test
latexmk -jobname=rm023 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{auriocus}\input{%%S}" typeface-test
latexmk -jobname=rm024 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{beraserif}\input{%%S}" typeface-test
latexmk -jobname=rm025 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{bitstreamcharter}\TFTESTtextfigures{libertine}\newcommand\TFTESTmathtypeface{mathdesign}\input{%%S}" typeface-test
latexmk -jobname=rm026 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{cmbright}\newcommand\TFTESTmathtypeface{cmbright}\input{%%S}" typeface-test
latexmk -jobname=rm027 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{cmdunhill}\input{%%S}" typeface-test
latexmk -jobname=rm028 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{cmfibonacci}\input{%%S}" typeface-test
latexmk -jobname=rm029 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{computermodern}\newcommand\TFTESTmathtypeface{ams}\input{%%S}" typeface-test
latexmk -jobname=rm030 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{computermodern}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{ams}\newcommand\TFTESTfontencoding{OT1}\input{%%S}" typeface-test
latexmk -jobname=rm031 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{concrete}\newcommand\TFTESTmathtypeface{concrete}\input{%%S}" typeface-test
latexmk -jobname=rm032 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{dayrom}\input{%%S}" typeface-test
latexmk -jobname=rm033 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{dayrom:s}\input{%%S}" typeface-test
latexmk -jobname=rm034 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{dejavu}\input{%%S}" typeface-test
latexmk -jobname=rm035 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{dejavu:condensed}\input{%%S}" typeface-test
latexmk -jobname=rm036 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{droid}\input{%%S}" typeface-test
latexmk -jobname=rm037 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{europeanmodern}\newcommand\TFTESTmathtypeface{ams}\input{%%S}" typeface-test
latexmk -jobname=rm038 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{europeanmodern}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{euler}\input{%%S}" typeface-test
latexmk -jobname=rm039 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gfsartemisia}\input{%%S}" typeface-test
latexmk -jobname=rm040 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gfsartemisia}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{anttor:condensed:light}\input{%%S}" typeface-test
latexmk -jobname=rm041 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gfsbodoni}\input{%%S}" typeface-test
latexmk -jobname=rm042 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gfsdidot}\input{%%S}" typeface-test
latexmk -jobname=rm043 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gfsneohellenic}\newcommand\TFTESTmathtypeface{cmbright}\input{%%S}" typeface-test
latexmk -jobname=rm044 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gyrebonum}\input{%%S}" typeface-test
latexmk -jobname=rm045 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gyrepagella}\newcommand\TFTESTtextfigures{palatino}\newcommand\TFTESTmathtypeface{pazo}\input{%%S}" typeface-test
latexmk -jobname=rm046 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gyreschola}\newcommand\TFTESTmathtypeface{mathdesign}\input{%%S}" typeface-test
latexmk -jobname=rm047 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{gyretermes}\newcommand\TFTESTsymbolstypeface{mathabx}\input{%%S}" typeface-test
latexmk -jobname=rm048 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{iwona}\newcommand\TFTESTmathtypeface{iwona}\input{%%S}" typeface-test
latexmk -jobname=rm049 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{iwona:light}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{iwona:light}\input{%%S}" typeface-test
latexmk -jobname=rm050 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{jamtimes}\newcommand\TFTESTmathtypeface{ams}\input{%%S}" typeface-test
latexmk -jobname=rm051 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kerkis}\input{%%S}" typeface-test
latexmk -jobname=rm052 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kpfonts}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTsanstypeface{kpfonts:lsf}\input{%%S}" typeface-test
latexmk -jobname=rm053 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kpfonts:largesmallcaps}\input{%%S}" typeface-test
latexmk -jobname=rm054 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kpfonts:light}\input{%%S}" typeface-test
latexmk -jobname=rm055 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kpfonts:light:nofligatures}\newcommand\TFTESTtextfigures{liningfigures}\input{%%S}" typeface-test
latexmk -jobname=rm056 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kpfonts:oldstyle}\input{%%S}" typeface-test
latexmk -jobname=rm057 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kpfonts:veryoldstyle}\input{%%S}" typeface-test
latexmk -jobname=rm058 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{kurier}\newcommand\TFTESTmathtypeface{kurier}\input{%%S}" typeface-test
latexmk -jobname=rm059 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{latinmodern}\input{%%S}" typeface-test
latexmk -jobname=rm060 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{latinmodern:boldsc}\input{%%S}" typeface-test
latexmk -jobname=rm061 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{libertine}\newcommand\TFTESTsanstypeface{biolinum:scale:1}\newcommand\TFTESTmathtypeface{pazo}\input{%%S}" typeface-test
latexmk -jobname=rm062 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{libertine}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTsanstypeface{arial:scale:uppercase}\newcommand\TFTESTmathtypeface{adobeminionpro:lf}\input{%%S}" typeface-test
latexmk -jobname=rm063 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{lucidabright}\newcommand\TFTESTmathtypeface{pazo}\input{%%S}" typeface-test
latexmk -jobname=rm064 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{lucidabright:lucidasmallscale}\newcommand\TFTESTtextfigures{osf}\input{%%S}" typeface-test
latexmk -jobname=rm065 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{newcenturyschoolbook}\newcommand\TFTESTmathtypeface{fourier}\input{%%S}" typeface-test
latexmk -jobname=rm066 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{palatino}\newcommand\TFTESTmathtypeface{pazo}\input{%%S}" typeface-test
latexmk -jobname=rm067 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{palatino}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{fourier}\input{%%S}" typeface-test
latexmk -jobname=rm068 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{ptserif}\input{%%S}" typeface-test
latexmk -jobname=rm069 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{pxfonts}\input{%%S}" typeface-test
latexmk -jobname=rm070 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{times}\newcommand\TFTESTmathtypeface{mtpro:lite}\input{%%S}" typeface-test
latexmk -jobname=rm071 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{times}\newcommand\TFTESTmathtypeface{mathptmx}\input{%%S}" typeface-test
latexmk -jobname=rm072 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{txfonts}\input{%%S}" typeface-test
latexmk -jobname=rm073 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{txfonts:new}\newcommand\TFTESTmathtypeface{txfonts:new:varg:cmintegrals:cmbraces}\input{%%S}" typeface-test
latexmk -jobname=rm074 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{uncial}\TFTESTmathtypeface{arev}\input{%%S}" typeface-test
latexmk -jobname=rm075 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{urwantiqua}\newcommand\TFTESTmathtypeface{mtpro}\input{%%S}" typeface-test
latexmk -jobname=rm076 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{urwbookman}\newcommand\TFTESTmathtypeface{pazo}\input{%%S}" typeface-test
latexmk -jobname=rm077 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{urwgaramond}\newcommand\TFTESTmathtypeface{mathdesign}\input{%%S}" typeface-test
latexmk -jobname=rm078 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{urwgaramond}\newcommand\TFTESTmathtypeface{mathdesign}\newcommand\TFTESTtextfigures{palatino}\input{%%S}" typeface-test
latexmk -jobname=rm079 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{urwnimbus}\newcommand\TFTESTsanstypeface{urwnimbus}\input{%%S}" typeface-test
latexmk -jobname=rm080 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{utopia}\newcommand\TFTESTmathtypeface{mathdesign}\input{%%S}" typeface-test
latexmk -jobname=rm081 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{utopia}\newcommand\TFTESTtextfigures{libertine:spacing:-10}\newcommand\TFTESTmathtypeface{mtpro}\input{%%S}" typeface-test
latexmk -jobname=rm082 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{zapfchancery}\input{%%S}" typeface-test
latexmk -jobname=rm083 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobebembo}\input{%%S}" typeface-test
latexmk -jobname=rm084 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobecaslon}\input{%%S}" typeface-test
latexmk -jobname=rm085 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobegaramond}\input{%%S}" typeface-test
latexmk -jobname=rm086 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobegranjon}\input{%%S}" typeface-test
latexmk -jobname=rm087 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobejanson}\newcommand\TFTESTmathtypeface{fourier}\input{%%S}" typeface-test
latexmk -jobname=rm088 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobejenson}\newcommand\TFTESTmathtypeface{adobeminionpro}\input{%%S}" typeface-test
latexmk -jobname=rm089 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobejenson}\newcommand\TFTESTtextfigures{adobesabon}\newcommand\TFTESTmathtypeface{pazo}\input{%%S}" typeface-test
latexmk -jobname=rm090 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobelucida}\newcommand\TFTESTmathtypeface{arev}\input{%%S}" typeface-test
latexmk -jobname=rm091 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobeminionpro}\newcommand\TFTESTmathtypeface{adobeminionpro}\input{%%S}" typeface-test
latexmk -jobname=rm092 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobesabon}\newcommand\TFTESTmathtypeface{adobeminionpro}\input{%%S}" typeface-test
latexmk -jobname=rm093 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{adobetimesexpert}\newcommand\TFTESTmathtypeface{mtpro}\input{%%S}" typeface-test
latexmk -jobname=rm094 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{hoeflertext}\input{%%S}" typeface-test
latexmk -jobname=rm095 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{linotypedidot}\newcommand\TFTESTmathtypeface{mathdesign}\input{%%S}" typeface-test
latexmk -jobname=rm096 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{linotypesabon}\newcommand\TFTESTtextfigures{adobeminionpro:spacing:-20}\input{%%S}" typeface-test
latexmk -jobname=rm097 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{linotypesabon}\newcommand\TFTESTtextfigures{adobeminionpro:spacing:0:lkern:-50:rkern:50}\input{%%S}" typeface-test
latexmk -jobname=rm098 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{linotypesabon}\newcommand\TFTESTtextfigures{adobeminionpro:spacing:200}\input{%%S}" typeface-test
latexmk -jobname=rm099 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{linotypesabon}\newcommand\TFTESTtextfigures{adobeminionpro:spacing:20}\input{%%S}" typeface-test
latexmk -jobname=rm100 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{linotypetimesten}\newcommand\TFTESTmathtypeface{mtpro}\input{%%S}" typeface-test
latexmk -jobname=rm101 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{monotypescotchroman}\input{%%S}" typeface-test
latexmk -jobname=rm102 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{ebgaramond}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{adobeminionpro:lsf}\input{%%S}" typeface-test
latexmk -jobname=rm103 -silent -f -pdf -pdflatex="pdflatex %%O \newcommand\TFTESTfontfamily{rm}\newcommand\TFTESTtypeface{vgaramond}\newcommand\TFTESTtextfigures{osf}\newcommand\TFTESTmathtypeface{mathdesign}\input{%%S}" typeface-test