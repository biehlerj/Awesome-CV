.PHONY: examples

CC = xelatex
OUTPUT_DIR = pdfs
RESUME_DIR = resume
RESUME_DOD_DIR = resume-dod
CV_DIR = cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
RESUME_DOD_SRCS = $(shell find $(RESUME_DOD_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

all: $(foreach x, coverletter cv resume resume-dod, $x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

resume-dod.pdf: resume-dod.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

cv.pdf: cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: coverletter.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
