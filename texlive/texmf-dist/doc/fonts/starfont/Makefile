all: starfont.zip

starfont.zip: COPYING README STRFNSAN.TTF STRFNSER.TTF Makefile \
   starfont.afm starfont.pfb fstr8x.tfm strfnser.afm strfnser.pfb fsts8x.tfm \
   starfont.sty starfont.map starfont.tex starfont.pdf \
   table.pdf
	zip starfont.zip $^

starfont.afm starfont.pfb: STRFNSAN.TTF
	ttf2pt1 -a -b STRFNSAN.TTF starfont

strfnser.afm strfnser.pfb: STRFNSER.TTF
	ttf2pt1 -a -b STRFNSER.TTF strfnser

fstr8x.tfm: starfont.afm
	afm2tfm starfont.afm fstr8x.tfm

fsts8x.tfm: strfnser.afm
	afm2tfm strfnser.afm fsts8x.tfm

starfont.pdf: starfont.tex
	pdflatex starfont
