
DOCUMENT = ecg.resume.tex

all:
	pdflatex $(DOCUMENT)

clean:
	rm $(DOCUMENT:.tex=.pdf) $(DOCUMENT:.tex=.out) $(DOCUMENT:.tex=.aux) $(DOCUMENT:.tex=.log)

clean-keep-pdf:
	rm $(DOCUMENT:.tex=.out) $(DOCUMENT:.tex=.aux) $(DOCUMENT:.tex=.log)
