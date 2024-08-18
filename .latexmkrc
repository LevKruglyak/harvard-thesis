$preview_continuous_mode = 1;
$pdf_previewer = 'none';
$pdf_mode = 1;

$biber = 'biber %O %S';
$bibtex_use = 2;

# Setting output directory breaks a lot of things (biber, makeindex)

$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1'
