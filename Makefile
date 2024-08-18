all:
	latexmk -pdf thesis.tex

# SRCS = $(shell find . -name '*.tex')
#
# all: $(SRCS) thesis.bbl
# 	@$(MAKE) pdflatex
#
# pdflatex:
# 	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape -recorder "thesis.tex"
#
# thesis.bbl: refs.bib
# 	@$(MAKE) pdflatex
# 	biber thesis.bcf
#
# clean:
# 	@rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.toc *.synctex.gz *.fls *.idx *.ilg *.ind */*.aux
