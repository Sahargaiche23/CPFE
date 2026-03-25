# Makefile pour compiler le Guide DevOps CNSS
# Requiert: pdflatex, inkscape (pour SVG)

MAIN = main
LATEX = pdflatex
LATEXFLAGS = --shell-escape

.PHONY: all clean pdf

all: pdf

pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex images/*.svg
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

clean:
	rm -f *.aux *.log *.toc *.out *.pdf *.svg-tex *.svg.pdf

# Alternative avec latexmk
latexmk:
	latexmk -pdf -shell-escape $(MAIN).tex

# Nettoyer et recompiler
rebuild: clean pdf
