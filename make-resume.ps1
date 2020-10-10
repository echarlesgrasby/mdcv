Param([string]$paramDebug="N")
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

$codeDir="D:\repos\mdcv\code"
$sourceCode="$codeDir\ecg.resume.tex"
$debug=$paramDebug
cd $codeDir

if (Test-Path "$sourceCode"){ 
	pdflatex "$sourceCode";
	Write-Output "------ ------" 
	Write-Output "Press any key to exit.." 
	
	<#
		LaTeX is very verbose and outputs a bunch of build information whenever you execute a build..
		If debug != "Y", remove the extra output files to just leave the .tex source and the PDF output
	#>
	if ($debug -ne "Y"){
	  ##==remove log==##
	  $removeItem=$sourceCode.Replace(".tex",".log");
      Remove-Item $removeItem; echo "Removing $removeItem.."
	  
	  ##==remove aux==##
	  $removeItem=$sourceCode.Replace(".tex",".aux");
      Remove-Item $removeItem; echo "Removing $removeItem"
	}

	cd ..\
	$PDF=$sourceCode.Replace(".tex",".pdf")
	Remove-Item *pdf
	Move-Item $PDF .\
	
	$host.ui.RawUI.ReadKey() > $null
	[Environment]::Exit(0);
}
else{
    Write-Output "$sourceCode does not exist!"
    $host.ui.RawUI.ReadKey() > $null
	[Environment]::Exit(1);
}
