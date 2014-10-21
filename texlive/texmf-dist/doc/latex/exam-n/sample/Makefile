all: sample_exam.pdf

sample_exam.pdf: numerical1-solution.pdf

sample_exam_solution.pdf: sample_exam_solution.tex

sample_exam_solution.tex: sample_exam.tex
	rm -f $@
	sed '1s/documentclass/documentclass[showsolutions]/' sample_exam.tex >sample_exam_solution.tex

%.pdf: %.tex
	TEXINPUTS=..: pdflatex $<
	if grep 'Rerun to get cross' ${<:.tex=.log}; then TEXINPUTS=..: pdflatex $<; else :; fi

clean:
	rm -f sample_exam*.pdf sample_exam_solution.tex *.log *.aux
