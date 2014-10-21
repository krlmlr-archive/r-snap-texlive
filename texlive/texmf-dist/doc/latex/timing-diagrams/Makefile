NAME=timing-diagrams

all: diagrams-examples.pdf $(NAME).zip

version.txt: force
	@echo "$(NAME) version $$(git rev-parse HEAD).\n\
Commited on $$(git show -s HEAD --pretty=format:'%cd')." > $@

diagrams-examples.pdf: diagrams-examples.tex timing-diagrams.sty
	pdflatex -interaction nonstopmode diagrams-examples.tex

FILES=diagrams-examples.pdf diagrams-examples.tex timing-diagrams.sty README Makefile

$(NAME).zip: version.txt $(FILES)
	cd .. && zip $@ $(NAME)/version.txt $(FILES:%=$(NAME)/%) && mv $(NAME).zip $(NAME)/

force:
.PHONY: all force
