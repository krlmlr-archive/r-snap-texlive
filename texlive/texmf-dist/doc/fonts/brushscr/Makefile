# Dependencies

%.ps:%.dvi
	dvips -P pbsi -o $@ $<

%.dvi:%.tex
	latex $<
	while grep Rerun $*.log ; do latex $< ; done

# Phony targets

.PHONY: all clean samples tarball

# Rules

all:
	make clean
	sed -e '/EndCharMetrics/ r kern.txt' BrushScriptX-Italic.afm > pbsi.afm
	tex generate.tex
	for file in pbsi*.pl;  do pltotf $$file; done
	for file in pbsi*.vpl; do vptovf $$file; done

clean:
	-rm core *~ pbsi.afm
	-rm *.tfm *.vf *.pl *.vpl *.mtx *.fd
	-rm *.log *.aux *.dvi *.ps *.pdf

samples: t1sample.ps sample.ps example.ps

tarball:
	make all
	tar cvf $$HOME/export/brushscr.tar				\
	BrushScriptX-Italic.pfa BrushScriptX-Italic.afm kern.txt	\
	Makefile README config.pbsi pbsi.map pbsi.sty			\
	AAA_readme.tex sample.tex example.tex *.fd *.vf *.tfm
	gzip -fv9 $$HOME/export/brushscr.tar

t1sample.ps: t1sample.dvi

sample.ps: sample.dvi

example.ps: example.dvi

t1sample.dvi: t1sample.tex

sample.dvi: sample.tex

example.dvi: example.tex
