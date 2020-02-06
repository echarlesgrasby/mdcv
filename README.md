# mdcv

My attempt at versioning a personal website and my resume using Markdown and Pandoc. Inspired by Luke Smith, himself. 

This project is built and rendered via a Makefile in the project directory, which invokes Pandoc and creates an HTML website (using styles specified in styles.css) and a static .PDF file suitable for printing. 

## Dependencies 

 * Pandoc
 * bash
 * LaTeX

## Build Instructions

Compile with the following:

 ```make compile && sudo make install ```

That's it. Once the build process completes, copy the output files to your webhost via SFTP.   
