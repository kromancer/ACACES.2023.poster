# LaTeX Makefile

# Change the filename here if your main LaTeX file has a different name
MAIN = main

# LaTeX compiler
LATEX = pdflatex

# LaTeX flags
FLAGS = -shell-escape

# BibTeX compiler
BIBTEX = bibtex

# Build PDF
pdf:
	$(LATEX)  $(FLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(LATEX) $(FLAGS) $(MAIN).tex

# Clean intermediate files
clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).log $(MAIN).out $(MAIN).pdf

# Clean all files except source
distclean: clean
	rm -f $(MAIN).pdf
