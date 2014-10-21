all:	test-eco.pdf test-hfo.pdf

test-eco.pdf:
	pdflatex test-eco
	pdflatex test-eco

test-hfo.pdf:
	pdflatex test-hfo
	pdflatex test-hfo

distclean:
	@-rm test-eco.{aux,log,pdf}
	@-rm test-hfo.{aux,log,pdf}
