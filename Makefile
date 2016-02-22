# Copyright © 2015 Ekaitz Zarraga <ekaitzzarraga@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

# Makefile for easy documentation in HTML and PDF

C 	= pandoc

# Set default to all
.DEFAULT_GOAL := all

# Add some flag shit
#FLAGS	+=

CONTENT = content/Curriculum.md


# HTML TARGET
#-------------------------------------------------------------------------
TARGET_HTML = Curriculum.html

.PHONY: html
html: $(TARGET_HTML)

$(TARGET_HTML): $(CONTENT)
	$(C) $(FLAGS) -o $@ $(CONTENT)




# PDF TARGET
#-------------------------------------------------------------------------
TARGET_PDF = Curriculum.pdf

# Add PDF related FLAGS
PDF_FLAGS 	= --latex-engine=xelatex

.PHONY: pdf
pdf: $(TARGET_PDF)

$(TARGET_PDF): $(CONTENT)
	$(C) $(FLAGS) -o $@ $(CONTENT) $(PDF_FLAGS)



# ALL TARGET
#-------------------------------------------------------------------------
.PHONY: all
all: pdf html



# CLEAN TARGET
#-------------------------------------------------------------------------
.PHONY: clean
clean:
	rm -f $(TARGET_PDF) $(TARGET_HTML)
