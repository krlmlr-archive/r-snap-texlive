# ======================================================================
#     Makefile -- Part of the blacklettert1 package
#     Copyright 2002 Torsten Bronger <torsten.bronger@gmx.de>
# 
#   This program may be distributed and/or modified under the
#   conditions of the LaTeX Project Public License, either version 1.2
#   of this license or (at your option) any later version.
#   The latest version of this license is in
#     http://www.latex-project.org/lppl.txt
#   and version 1.2 or later is part of all distributions of LaTeX
#   version 1999/12/01 or later.
# ======================================================================

# directory for TeX inputs.  TDS assumed!
TEXMFDIR= /usr/local/teTeX/share/texmf

# The standard file permissions for installed 
# non-executables
PERMS= a+r,u+w

# No changes should be necessary below this line 
# -----------------------------------------------------

%.vf %.tfm : %.vpl
	vptovf $< $(basename $<).vf $(basename $<).tfm

%.pdf : %.dtx
	pdflatex $<
	pdflatex $<

all : t1yfrak.fd

doc : blacklettert1.pdf

virtualfonts : tfrak.vf tfrakls.vf tswab.vf tgoth.vf

t1yfrak.fd : blacklettert1.dtx
	tex blacklettert1.ins
	- rm yfrak.mtx yswab.mtx ygoth.mtx
	tex yutoyt1
	make virtualfonts

install : all
	install -d $(TEXMFDIR)/fonts/vf/public/gothic
	install -d $(TEXMFDIR)/fonts/tfm/public/gothic
	install -d $(TEXMFDIR)/tex/latex/blacklettert1
	install --mode=$(PERMS) tfrak.vf tfrakls.vf tswab.vf \
	  tgoth.vf $(TEXMFDIR)/fonts/vf/public/gothic
	install --mode=$(PERMS) tfrak.tfm tfrakls.tfm tswab.tfm \
	  tgoth.tfm $(TEXMFDIR)/fonts/tfm/public/gothic
	install --mode=$(PERMS) t1yfrak.fd $(TEXMFDIR)/tex/latex/blacklettert1

distri : all
	cd blacklettert1/
	cd ..
	- rm blacklettert1/*
	cp README INSTALL COPYING Makefile blacklettert1.dtx blacklettert1.ins \
	  blacklettert1/
	cp cmbsy10.pl cmmi10.pl cmr10.pl cmsy10.pl ecbx1000.pl \
	  ecrm1000.pl cmbx10.pl cmmib10.pl cmr7.pl \
	  ecrm0700.pl blacklettert1/
	cp yfrak.pl yswab.pl ygoth.pl cmu10.pl blacklettert1/
	cp tfrak.vf tfrakls.vf tswab.vf tgoth.vf blacklettert1/
	cp tfrak.tfm tfrakls.tfm tswab.tfm tgoth.tfm blacklettert1/
	cp t1yfrak.fd blacklettert1/
	tar -czf blacklettert1.tar.gz blacklettert1/*
