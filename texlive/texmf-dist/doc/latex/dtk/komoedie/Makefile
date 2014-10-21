
# Rolf Niepraschk, 2005/02/20, Rolf.Niepraschk@ptb.de
#
# `Makefile' für "Die TeXnische Komödie", Heft 2/2005

MAIN = komoedie

ARCHNAME = $(MAIN)-03-09-$(shell date +%y%m%d)

LATEX = pdflatex
#LATEX = xelatex

MAKEINDEXSTYLE = dtk-idx.ist
MAKEGLOSSARYSTYLE = dtk-adr.ist

ifeq ($(MAKECMDGOALS),corr)
  DOCUMENTOPT = '\\PassOptionsToClass{draft}{dtk}'
endif

# Alle kompletten Artikel mit Literaturverzeichnis
# (Namen der Hauptdateien mit \documentclass usw.).
ARTICLES_BIB =  

# Alle anderen kompletten Artikel
# (Namen der Hauptdateien mit \documentclass usw.).
ARTICLES = 

# Alle verwendeten bib-Dateien
BIBS =  


# Enthält das Dokument inline-PS-Code (als Parameter von 
# \PSforPDF-Anweisungen; z.B. PSTricks, psfrag, EPS-Grafiken,...), 
# so ist hier "1" anzugeben.
INLINE_PS = 0

# Alle sonstigen Dateien, die in das Hauptdokument eingefügt werden.
OTHER_INPUTS = impressum.tex termine.tex adressen.tex 

ifneq ($(ARTICLES_BIB),)
  BBLS = $(foreach i,$(basename $(ARTICLES_BIB)),$(addprefix $i, .bbl)) 
endif

ifeq ($(INLINE_PS),1)
  PDF_CONTAINER = $(MAIN)-pics.pdf
endif

ALL_INPUTS = $(ARTICLES_BIB) $(ARTICLES) $(OTHER_INPUTS)

ALL_ARTICLES = $(foreach i,$(basename $(ARTICLES_BIB)),$(addprefix $i, .pdf)) \
               $(foreach i,$(basename $(ARTICLES)),$(addprefix $i, .pdf))

ARCHFILES = $(MAIN).tex $(ALL_INPUTS) $(BIBS) Makefile Makefile.in \
            dtk.dtx dtk.ins
 

all : rm-old ruecken.pdf $(MAIN).pdf

corr : $(MAIN).pdf

rm-old : 
	$(RM) ruecken.pdf $(MAIN).pdf

articles : $(MAIN).inf $(ALL_ARTICLES) $(BBLS)

$(MAIN).inf : $(MAIN).pdf 

$(MAIN).pdf : $(MAIN).tex $(ALL_INPUTS) $(BBLS) $(PDF_CONTAINER)

$(MAIN).dvi : #$(MAIN).tex $(ALL_INPUTS)
	export TEXMFHOME=./texmf
	latex $(MAIN).tex

$(MAIN)-pics.ps : $(MAIN).dvi
	dvips -Ppdf -o $@ $<

$(MAIN)-pics.pdf : $(MAIN)-pics.ps 
	GS_OPTIONS=-dPDFSETTINGS=/prepress ps2pdf $< $@

%.bbl : %.aux $(BIBS)
	bibtex $<

%.aux : %.ltx
	$(LATEX) $<
	$(RM) $(basename $@).pdf
	
%.aux : %.tex
	$(LATEX) $<
	$(RM) $(basename $@).pdf

xxx : 
	@echo $(basename $(ARTICLES_BIB))
	@echo
	@echo $(foreach i,$(basename $(ARTICLES_BIB)),$(addprefix $i, .bbl))
	@echo
	@echo $(OTHER_INPUTS)

ruecken.pdf : ruecken.tex
	$(LATEX) ruecken.tex

ruecken.tex : $(MAIN).tex
	 @perl -n -e 'print "\
	\\documentclass[11pt,a4paper]{article}                                    \n\
	\\usepackage[T1]{fontenc}						\n\
	\\usepackage{lmodern}							\n\
	\\oddsidemargin=-1in                                                      \n\
	\\unitlength=1mm                                                          \n\
	\\begin{document}                                                         \n\
	\\begin{picture}(210,4)                                                        \n\
	  \\put(5,2){\\makebox(100,0)[l]{\\tiny Die \\TeX nische Kom\\\"odie $$1}}\n\
	  \\put(0,0){\\line(-1,0){5}}                                             \n\
	  \\put(0,0){\\line(0,-1){5}}                                             \n\
	  \\put(0,4){\\line(-1,0){5}}                                             \n\
	  \\put(0,4){\\line(0,1){5}}                                              \n\
	\\end{picture}                                                            \n\
	\\end{document}                                                                \n\
	" if m/DieTeXnischeKomoedie\{(.*)\}\{(.*)\}\{(.*)\}/' $(MAIN).tex > ruecken.tex

clean : _clean
	$(RM) $(addprefix $(MAIN), .inf) 
	$(RM) $(foreach i,$(basename $(ARTICLES_BIB)),$(addprefix $i, \
	  .pdf .log .aux .bbl .blg .ind .ilg .gls .glg)) \
	  $(addprefix ruecken, .tex .log .aux) \
	  $(MAIN)-pics.pdf

veryclean : clean
	$(RM) $(MAIN).pdf ruecken.pdf $(ALL_ARTICLES)

arch :
	zip $(ARCHNAME).zip $(ARCHFILES)

.PHONY : all corr arch clean veryclean
# nur noetig, wenn Dateien mit dem selben Namen existieren

.INTERMEDIATE : $(MAIN).dvi $(MAIN)-pics.ps

ifneq ($(MAKECMDGOALS),arch)
  include Makefile.in
endif



