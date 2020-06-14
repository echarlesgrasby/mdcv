# mdcv

## Purpose

This is simply a repository to track any changes that I make to my print resume. It is written in LaTeX and I compile it into a PDF whenever I want to make changes to it.

This repository was originally used for versioning a resume from Markdown, but I've since scrapped that and re-written the entire thing as a LaTeX doc. 

## Compile
 _these are really just notes for myself.._

 * Linux (uses a Makefile)
	- To build this on linux, pull the repo down locally and ensure that pdflatex is installed.
	- Run make all && make-keep-pdf

 * Windows (uses a Powershell script)
	- To build this on your windows machine, pull the repo down locally and ensure that pdflatex and SumatraPDF are installed.
	- In a powershell session, run this invocation in the resume directory: _make_resume.ps1 "N"_

