
DOCUMENT = ./code/ecg.resume.tex
DOCKERFILE = ./Dockerfile

.PHONY: doc-build doc-run doc-clean

doc-build:
	docker build - < $(DOCKERFILE) --tag resume-builder:latest

doc-run:
	docker run -t -i -v `pwd`:/app debian:latest /bin/bash

doc-clean:
	docker rm debian:latest

all:
	pdflatex $(DOCUMENT)

clean:
	rm $(DOCUMENT:.tex=.pdf) $(DOCUMENT:.tex=.out) $(DOCUMENT:.tex=.aux) $(DOCUMENT:.tex=.log)

clean-keep-pdf:
	rm $(DOCUMENT:.tex=.out) $(DOCUMENT:.tex=.aux) $(DOCUMENT:.tex=.log)
