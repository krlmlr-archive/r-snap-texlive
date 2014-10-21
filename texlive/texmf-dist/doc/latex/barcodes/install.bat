@echo off
echo off
rem Installation of the barcode fonts
rem willadt 1999-05-29
rem you have to set the following variable
rem according to your system
set TEXMF=C:\TEXMF
rem further down, you need not change anything
rem *******************************************
rem under your TEXMF directory, there should be
rem /fonts/source/public
rem /fonts/tfm/public
rem /fonts/vf/public
rem /tex/generic/misc
rem /tex/latex/misc
rem plain TeX should be run by 'tex filename'
rem latex2e should be run by 'latex filename'
rem vptovf should be run by 'vptovf x y z'
cls
IF NOT %1a==a SET TEXMF=%1
echo We are going to install the barcode fonts
echo to the directory branch %TEXMF%
echo If you don't want that, 
echo or if this is not correct, press CTRL-BREAK now,
echo else
pause
echo Ok, we're going...
echo *****************************************************
echo checking/making directories..........................
echo ...VF dir
if not exist %TEXMF%\fonts\vf\public\NUL md %TEXMF%\fonts\vf\public
if not exist %TEXMF%\fonts\vf\public\NUL goto error
echo ...MF dir
if not exist %TEXMF%\fonts\source\public\NUL md %TEXMF%\fonts\source\public
if not exist %TEXMF%\fonts\source\public\misc\NUL md %TEXMF%\fonts\source\public\misc
if not exist %TEXMF%\fonts\source\public\misc\NUL goto error
echo ...TFM dir
if not exist %TEXMF%\fonts\tfm\public\NUL md %TEXMF%\fonts\tfm\public
if not exist %TEXMF%\fonts\tfm\public\misc\NUL md %TEXMF%\fonts\tfm\public\misc
if not exist %TEXMF%\fonts\tfm\public\misc\NUL goto error
echo ...sty dir
if not exist %TEXMF%\tex\latex\misc\NUL md %TEXMF%\tex\latex\misc
if not exist %TEXMF%\tex\latex\misc\NUL goto error
echo ...tex (generic) dir
if not exist %TEXMF%\tex\generic\misc\NUL md %TEXMF%\tex\generic\misc
if not exist %TEXMF%\tex\generic\misc\NUL goto error
echo *****************************************************
echo Unpacking............................................
call tex barcodes.ins
rem ******************* 
rem * at first the vf's
echo *****************************************************
echo Making and moving VF files...........................
FOR %%a IN (wlcdb wlcf39 wlitf) DO vptovf %%a.vpl %%a.vf %%a.tfm
copy *.vf %TEXMF%\fonts\vf\public
del wl*.vf
rem *******************
rem * then the mf's 
echo *****************************************************
echo Moving MF files......................................
copy *.mf %TEXMF%\fonts\source\public\misc
rem *******************
rem * then the tfm's
echo *****************************************************
echo Moving tfm files.....................................
copy *.tfm %TEXMF%\fonts\tfm\public\misc
rem *******************
rem * TeX files
echo *****************************************************
echo Moving .sty files....................................
copy *.sty %TEXMF%\tex\latex\misc
rem *******************
rem * TeX files
echo *****************************************************
echo Moving TeX files.....................................
copy code39.tex %TEXMF%\tex\generic\misc
rem *******************
rem * documentation
echo *****************************************************
echo Now running LaTeX on the documentation...............
call latex bcfaq
call latex bcfaq
call latex eandoc
call latex eandoc
echo *****************************************************
echo now comes the hardest part: 
echo running the examples file through TeX................
call tex examples
goto ende
:error
echo *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
echo There was an error, sorry.
echo Please install by hand.
echo *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
goto schluss
:ende
cls
echo *****************************************************
echo We're done. Have fun.
echo You should update your filename database, by the way.
echo and you will perhaps want to install codean.pl.
echo If you do not want to have temporary files removed,
echo press CTRL-BREAK now! 
echo else
pause
for %%a in (*.log wl*.vf wl*.tfm) do del %%a
echo perhaps you can do more cleanup, I'm really done now.
:schluss
