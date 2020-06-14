Param($paramDebug="N")
<#
==========================================================================
eric c grasby
-- --
This script is meant to function as a sort of "Makefile", to compile a LaTeX document into a PDF as I work on it.
This is to make writing in LaTeX more ergonomic on Windows. I have the powershell invocation mapped to Alt+Shift+A in Notepad++.
I use SumatraPDF to view the PDF output as it has a live preview option, so the output changes as I compile it. Neato.
-- --
The script builds the PDF, outputs all the compile-time info to STDOUT, and then waits for the user to press any key before terminating the powershell session
==========================================================================
#>

cd "D:\sandbox\latex\resume\"
$sourceCode=".\ecg.resume.tex"
$debug=$paramDebug

if (Test-Path "$sourceCode"){ 
	pdflatex "$sourceCode";
	Write-Output "------ ------" 
	Write-Output "Press any key to exit.." 
	
<#
  LaTeX is very verbose and outputs a bunch of build information whenever you execute a build..
  If debug != "Y", remove the extra output files to just leave the .tex source and the PDF output
#>
	if ($debug -ne "Y"){ 
	  $removeItem=$sourceCode -replace ".tex" ".log"; Remove-Item $removeItem
	  $removeItem=$sourceCode -replace ".tex" ".aux"; Remove-Item $removeItem
	}

	while( ! [System.Console]::ReadKey().Key){ }
	exit 0
}
else{
Write-Output "$sourceCode does not exist!"
while( ! [System.Console]::ReadKey().Key){ }
exit 1
}
