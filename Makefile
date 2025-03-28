SRCS = $(shell find . -name '*.tex')

all: $(SRCS) thesis.bbl
	@$(MAKE) pdflatex
	@$(MAKE) pdflatex

pdflatex:
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -recorder "thesis.tex"

thesis.bbl: thesis.bib
	@$(MAKE) pdflatex
	biber thesis.bcf

clean:
	@rm -f *.aux *.bbl* *.bcf* *.blg *.log *.out *.run.xml *.toc *.synctex.gz *.fls *.idx *.ilg *.ind */*.aux *.fdb_latexmk
