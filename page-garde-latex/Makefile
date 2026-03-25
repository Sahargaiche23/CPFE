# Makefile pour compiler la page de garde
MAIN = main
LATEX = pdflatex
LATEXFLAGS = -interaction=nonstopmode

.PHONY: all clean pdf

all: pdf

pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

clean:
	rm -f *.aux *.log *.toc *.out *.pdf

rebuild: clean pdf
