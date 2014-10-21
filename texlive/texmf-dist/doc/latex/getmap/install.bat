@echo off
rem Adjust these pathes for your installation.
rem Usually, you just need to change the base directory part!
set texmfpath=C:\texlive\texmf-local
set bindir=C:\texlive\2014\bin\win32\
set pckname=getmap
echo.
echo.
echo Installing %pckname% into %texmfpath%
echo.
echo Creating %pckname%.pdf
pdflatex -shell-escape %pckname%.dtx >nul
bibtex %pckname% >nul
makeindex -q -s gind.ist %pckname% >nul
makeindex -q -s gglo.ist %pckname%.glo -o %pckname%.gls >nul
pdflatex %pckname%.dtx >nul
bibtex %pckname% >nul
makeindex -q -s gind.ist %pckname% >nul
makeindex -q -s gglo.ist %pckname%.glo -o %pckname%.gls >nul
pdflatex %pckname%.dtx >nul
ren README.txt README >nul
echo Copying files to %texmfpath%
md %texmfpath%\scripts\%pckname% >nul
copy getmapdl.lua %texmfpath%\scripts\%pckname%\ >nul
md %texmfpath%\tex\latex\%pckname% >nul
copy *.sty %texmfpath%\tex\latex\%pckname% >nul
copy *.cfg %texmfpath%\tex\latex\%pckname% >nul
md %texmfpath%\doc\latex\%pckname% >nul
copy README %texmfpath%\doc\latex\%pckname% >nul
copy *.txt %texmfpath%\doc\latex\%pckname% >nul
copy *.tex %texmfpath%\doc\latex\%pckname% >nul
copy *.dtx %texmfpath%\doc\latex\%pckname% >nul
copy *.pdf %texmfpath%\doc\latex\%pckname% >nul
echo Running texhash
texhash >nul
del *.aux
del *.bib
del *.blg
del *.bbl
del *.gls
del *.glo
del *.hd
del *.idx
del *.ilg
del *.ind
del *.ins
del *.log
del *.out
del *.tex
del *.sty
del *.cfg
del *.toc
del *.txt
del *.png
del *.jpg
del *.epl
del getmapdl.lua
del README
del getmap.pdf
echo Create getmapdl.exe
pushd %bindir%
copy runscript.exe getmapdl.exe >nul
popd
echo.
echo Done
echo.