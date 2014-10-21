VERSION=`grep -A1 '\\\\ProvidesPackage' hfoldsty.dtx  | grep -v '\\\\ProvidesPackage' | sed 's/.* \\(v[0-9]*\\)\\.\\([0-9]*[a-z]*\\) .*/\\1_\\2/'`
VERSIONpp=`grep -A1 '\\\\ProvidesPackage' ../hfoldsty.dtx  | grep -v '\\\\ProvidesPackage' | sed 's/.* \\(v[0-9]*\\)\\.\\([0-9]*[a-z]*\\) .*/\\1_\\2/'`
INSTALL=install
BASEDIR=texmf
DOCDIR=$(BASEDIR)/doc/fonts/hfoldsty
STYDIR=$(BASEDIR)/tex/latex/hfoldsty
VFDIR=$(BASEDIR)/fonts/vf/public/hfoldsty
TFMDIR=$(BASEDIR)/fonts/tfm/public/hfoldsty
SOURCEDIR=$(BASEDIR)/source/fonts/hfoldsty

all:	fonts hfoldsty.sty hfoldsty.pdf copy clean

hfoldsty.sty: hfoldsty.dtx hfoldsty.ins
	pdflatex hfoldsty.ins

hfoldsty.pdf: hfoldsty.dtx
	pdflatex hfoldsty.dtx
	pdflatex hfoldsty.dtx
	makeindex -s gglo.ist -o hfoldsty.gls hfoldsty.glo
	pdflatex hfoldsty.dtx
	makeindex -s gind.ist hfoldsty
	pdflatex hfoldsty.dtx
	pdflatex hfoldsty.dtx

fonts:
	cd src && $(MAKE)

copy:
	if [ -d "$(DOCDIR)" ]; then rm -f $(DOCDIR)/*; else mkdir -p $(DOCDIR); fi
	if [ -d "$(STYDIR)" ]; then rm -f $(STYDIR)/*; else mkdir -p $(STYDIR); fi
	if [ -d "$(VFDIR)" ]; then rm -f $(VFDIR)/*; else mkdir -p $(VFDIR); fi
	if [ -d "$(TFMDIR)" ]; then rm -f $(TFMDIR)/*; else mkdir -p $(TFMDIR); fi
	if [ -d "$(SOURCEDIR)" ]; then rm -rf $(SOURCEDIR)/*; else mkdir -p $(SOURCEDIR); fi
	if [ ! -d "$(SOURCEDIR)/src" ]; then mkdir -p $(SOURCEDIR)/src; fi
	$(INSTALL) -m644 gpl.txt README TODO ChangeLog $(DOCDIR)
	$(INSTALL) -m644  hfoldsty.pdf hfoldsty.xml test/*.tex test/Makefile $(DOCDIR) 
	$(INSTALL) -m644  hfoldsty.sty $(STYDIR) 
	$(INSTALL) -m644  *.cpa *.fd $(STYDIR) 
	$(INSTALL) -m644  src/*.fd $(STYDIR)
	$(INSTALL) -m644  src/*.tfm $(TFMDIR)
	$(INSTALL) -m644  src/*.vf $(VFDIR)
	$(INSTALL) -m755  src/generate.sh $(SOURCEDIR)/src
	$(INSTALL) -m644  src/dostretch.mtx src/Makefile src/t19.etx src/TS1.etx $(SOURCEDIR)/src
	$(INSTALL) -m644  hfoldsty.dtx hfoldsty.ins Makefile $(SOURCEDIR)

clean:
	cd src && $(MAKE) clean
	@rm -f hfoldsty.aux hfoldsty.log hfoldsty.ind hfoldsty.glo
	@rm -f hfoldsty.gls hfoldsty.idx hfoldsty.toc hfoldsty.ilg

distclean: clean
	cd src && $(MAKE) distclean
	@rm -rf $(BASEDIR)
	@rm -f *~
	@rm -f hfo*.cpa *hfo*.fd hfoldsty.sty hfoldsty.pdf

zip:	all clean distzip distclean srczip

distzip:
	@rm -f hfoldsty-$(VERSION).zip
	cd texmf; zip -r ../hfoldsty-$(VERSIONpp).zip *

srczip:
	@rm -f hfoldsty-src-$(VERSION).zip
	zip -r hfoldsty-src-$(VERSION).zip src/generate.sh src/dostretch.mtx src/Makefile src/t19.etx src/TS1.etx test/*.tex Makefile README gpl.txt hfoldsty.xml hfoldsty.dtx hfoldsty.ins ChangeLog TODO

tar:	distzip srczip
	tar cvf hfoldsty-$(VERSION).tar README ChangeLog hfoldsty.xml gpl.txt hfoldsty-$(VERSION).zip hfoldsty-src-$(VERSION).zip

version:
	@echo $(VERSION)
