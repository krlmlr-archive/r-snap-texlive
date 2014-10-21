%%
%% This is file `README.txt',
%% 
%% This file is part of the `datenumber' package,
%% 
%% Copyright (C) 2001 J"org-Michael Schr"oder.
%% 
%% IMPORTANT NOTICE:
%% 
%% This program may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
%% For error reports, or offers to help make this a more powerful
%% tool, please contact me on schrj020@mail.uni-mainz.de
%% 

This program consists of all files listed here.

README.txt
datenumber.dtx
datenumber.ins
doc.tex
dov.dvi
docgerman.tex
docgerman.dvi

generated files:

datenumber.sty
datenumberenglish.ldf
datenumberUSenglish.ldf
datenumberfrench.ldf
datenumberspanish.ldf
datenumbergerman.ldf
datenumberdummy.ldf

Installation:

call latex on `datenumber.ins'
copy datenumber.sty and all *.ldf files to a place LaTeX can find it.
run `texhash', `initexmf -u' or something else.
say latex `doc.tex' (2 times) to get a short documentation

german documentation:

Eine kurze Dokumentation ist in docgerman.tex.

Für eine kurze Beschreibung des Programmcodes in Deutsch:
latex datenumber.dtx (2 mal)
makeindex -s gind.ist datenumber.idx
latex datenumber.dtx



