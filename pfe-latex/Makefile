# Makefile pour compiler le PFE
# Requiert: pdflatex ou xelatex

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
	rm -f *.aux *.log *.toc *.out *.lof *.lot *.pdf

# Compilation avec latexmk (recommandé)
latexmk:
	latexmk -pdf $(MAIN).tex

# Nettoyer et recompiler
rebuild: clean pdf

# Compilation avec XeLaTeX (pour Unicode avancé)
xelatex:
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex
