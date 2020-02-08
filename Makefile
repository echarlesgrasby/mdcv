compile:
		pandoc index.md -s -c custom-styles.css --toc -o index.html
		pandoc index.md --template=template.tex	--pdf-engine=xelatex -o eric-charles-grasby-resume.pdf