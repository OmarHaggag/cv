# Makefile for compiling CV and Cover Letters
# Output directory: ~/personal/cv/root-CV/cover

# Variables
OUTPUT_DIR = ~/personal/cv/root-CV
COVER_DIR = $(OUTPUT_DIR)/cover
PDFLATEX = pdflatex
XELATEX = xelatex

# Source files
CV_SRC = OmarHaggagCV.tex
COVER_LETTERS = cad/cover_letter_contract.tex \
                cad/cover_letter_permit.tex \
                ai/cover_letter_contract.tex \
                ai/cover_letter_permit.tex \
                power_electronics/cover_letter_contract.tex \
                power_electronics/cover_letter_permit.tex

# Target PDFs (in cover directory)
COVER_PDFS = $(COVER_DIR)/cover_letter_contract_cad.pdf \
             $(COVER_DIR)/cover_letter_permit_cad.pdf \
             $(COVER_DIR)/cover_letter_contract_ai.pdf \
             $(COVER_DIR)/cover_letter_permit_ai.pdf \
             $(COVER_DIR)/cover_letter_contract_power_electronics.pdf \
             $(COVER_DIR)/cover_letter_permit_power_electronics.pdf

# Default target
.PHONY: all clean cv cover letters setup

all: setup cv letters

# Create output directories
setup:
	@echo "Creating output directories..."
	@mkdir -p $(OUTPUT_DIR)
	@mkdir -p $(COVER_DIR)

# Compile CV (stays in root-CV, not in cover)
cv: $(CV_SRC)
	@echo "Compiling CV: $<"
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $<
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $<
	@echo "CV compiled to: $(OUTPUT_DIR)/$(CV_SRC:.tex=.pdf)"

# Compile all cover letters
letters: $(COVER_PDFS)

# Pattern rules for cover letters
$(COVER_DIR)/cover_letter_contract_cad.pdf: cad/cover_letter_contract.tex
	@echo "Compiling: $<"
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	@cp $(COVER_DIR)/cover_letter_contract.pdf $@
	@rm $(COVER_DIR)/cover_letter_contract.pdf

$(COVER_DIR)/cover_letter_permit_cad.pdf: cad/cover_letter_permit.tex
	@echo "Compiling: $<"
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	@cp $(COVER_DIR)/cover_letter_permit.pdf $@
	@rm $(COVER_DIR)/cover_letter_permit.pdf

$(COVER_DIR)/cover_letter_contract_ai.pdf: ai/cover_letter_contract.tex
	@echo "Compiling: $<"
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	@cp $(COVER_DIR)/cover_letter_contract.pdf $@
	@rm $(COVER_DIR)/cover_letter_contract.pdf

$(COVER_DIR)/cover_letter_permit_ai.pdf: ai/cover_letter_permit.tex
	@echo "Compiling: $<"
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	@cp $(COVER_DIR)/cover_letter_permit.pdf $@
	@rm $(COVER_DIR)/cover_letter_permit.pdf

$(COVER_DIR)/cover_letter_contract_power_electronics.pdf: power_electronics/cover_letter_contract.tex
	@echo "Compiling: $<"
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	@cp $(COVER_DIR)/cover_letter_contract.pdf $@
	@rm $(COVER_DIR)/cover_letter_contract.pdf

$(COVER_DIR)/cover_letter_permit_power_electronics.pdf: power_electronics/cover_letter_permit.tex
	@echo "Compiling: $<"
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	$(PDFLATEX) -output-directory=$(COVER_DIR) $<
	@cp $(COVER_DIR)/cover_letter_permit.pdf $@
	@rm $(COVER_DIR)/cover_letter_permit.pdf

# Compile only CAD cover letters
cad: setup
	@echo "Compiling CAD cover letters..."
	$(PDFLATEX) -output-directory=$(COVER_DIR) cad/cover_letter_contract.tex
	$(PDFLATEX) -output-directory=$(COVER_DIR) cad/cover_letter_contract.tex
	@cp $(COVER_DIR)/cover_letter_contract.pdf $(COVER_DIR)/cover_letter_contract_cad.pdf
	@rm $(COVER_DIR)/cover_letter_contract.pdf
	$(PDFLATEX) -output-directory=$(COVER_DIR) cad/cover_letter_permit.tex
	$(PDFLATEX) -output-directory=$(COVER_DIR) cad/cover_letter_permit.tex
	@cp $(COVER_DIR)/cover_letter_permit.pdf $(COVER_DIR)/cover_letter_permit_cad.pdf
	@rm $(COVER_DIR)/cover_letter_permit.pdf

# Compile only AI cover letters
ai: setup
	@echo "Compiling AI cover letters..."
	$(PDFLATEX) -output-directory=$(COVER_DIR) ai/cover_letter_contract.tex
	$(PDFLATEX) -output-directory=$(COVER_DIR) ai/cover_letter_contract.tex
	@cp $(COVER_DIR)/cover_letter_contract.pdf $(COVER_DIR)/cover_letter_contract_ai.pdf
	@rm $(COVER_DIR)/cover_letter_contract.pdf
	$(PDFLATEX) -output-directory=$(COVER_DIR) ai/cover_letter_permit.tex
	$(PDFLATEX) -output-directory=$(COVER_DIR) ai/cover_letter_permit.tex
	@cp $(COVER_DIR)/cover_letter_permit.pdf $(COVER_DIR)/cover_letter_permit_ai.pdf
	@rm $(COVER_DIR)/cover_letter_permit.pdf

# Compile only Power Electronics cover letters
power_electronics: setup
	@echo "Compiling Power Electronics cover letters..."
	$(PDFLATEX) -output-directory=$(COVER_DIR) power_electronics/cover_letter_contract.tex
	$(PDFLATEX) -output-directory=$(COVER_DIR) power_electronics/cover_letter_contract.tex
	@cp $(COVER_DIR)/cover_letter_contract.pdf $(COVER_DIR)/cover_letter_contract_power_electronics.pdf
	@rm $(COVER_DIR)/cover_letter_contract.pdf
	$(PDFLATEX) -output-directory=$(COVER_DIR) power_electronics/cover_letter_permit.tex
	$(PDFLATEX) -output-directory=$(COVER_DIR) power_electronics/cover_letter_permit.tex
	@cp $(COVER_DIR)/cover_letter_permit.pdf $(COVER_DIR)/cover_letter_permit_power_electronics.pdf
	@rm $(COVER_DIR)/cover_letter_permit.pdf

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	@rm -f $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.log $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.synctex.gz
	@rm -f $(COVER_DIR)/*.aux $(COVER_DIR)/*.log $(COVER_DIR)/*.out $(COVER_DIR)/*.synctex.gz
	@echo "Clean complete."

# Clean everything including PDFs
cleanall: clean
	@echo "Removing all generated PDFs..."
	@rm -f $(OUTPUT_DIR)/*.pdf
	@rm -f $(COVER_DIR)/*.pdf
	@echo "All generated files removed."

# Help target
help:
	@echo "Available targets:"
	@echo "  make all              - Compile CV and all cover letters"
	@echo "  make cv               - Compile CV only"
	@echo "  make letters          - Compile all cover letters"
	@echo "  make cad              - Compile CAD cover letters only"
	@echo "  make ai               - Compile AI cover letters only"
	@echo "  make power_electronics - Compile Power Electronics cover letters only"
	@echo "  make clean            - Remove auxiliary files"
	@echo "  make cleanall         - Remove all generated files including PDFs"
	@echo "  make help             - Show this help message"
