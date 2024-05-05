all:
	# To avoid \include errors
	mkdir -p build/chapters
	mkdir -p build/components

	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape -recorder -output-directory="build" "thesis.tex"

clean:
	rm -r build/
