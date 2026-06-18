# Makefile for ZzuThesis

LATEXMKOPTS = -xelatex -file-line-error -halt-on-error -interaction=nonstopmode
THESISMAIN = main
VARIANTMAINS = main-bachelor main-guomoruo main-blind main-promaster
PACKAGE = zzuthesis

THESISCONTENTS=$(THESISMAIN).tex data/*.tex
CLSFILES=$(PACKAGE).cls zzubachelor.cls zzuname.cls MS.cls zzupromaster.cls

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

all: thesis a3cover

.PHONY: all thesis variants a3cover clean

###### for thesis

thesis: $(THESISMAIN).pdf

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS)
	latexmk $(LATEXMKOPTS) $(THESISMAIN)

variants: $(addsuffix .pdf,$(VARIANTMAINS))

main-bachelor.pdf: main-bachelor.tex $(CLSFILES) data/*.tex
	latexmk $(LATEXMKOPTS) main-bachelor

main-guomoruo.pdf: main-guomoruo.tex $(CLSFILES) data/*.tex
	latexmk $(LATEXMKOPTS) main-guomoruo

main-blind.pdf: main-blind.tex $(CLSFILES) data/*.tex
	latexmk $(LATEXMKOPTS) main-blind

main-promaster.pdf: main-promaster.tex $(CLSFILES) data/*.tex
	latexmk $(LATEXMKOPTS) main-promaster

###### for a3cover

a3cover:a3cover.pdf

a3cover.pdf: spine.pdf $(THESISMAIN).pdf a3cover.tex
	xelatex a3cover.tex

spine.pdf: spine.tex
	xelatex spine.tex

##### clean

clean:
	latexmk -c $(THESISMAIN) $(VARIANTMAINS) spine a3cover
	-@$(RM) *~ *.bbl *.exa *.xdv data/*.aux
