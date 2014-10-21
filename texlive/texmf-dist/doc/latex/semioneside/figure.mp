%%
%% This is file `figure.mp',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% semioneside.dtx  (with options: `figure')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2005 by Stephan Hennig <stephanhennig@arcor.de>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
verbatimtex
\documentclass{article}
\begin{document}
\footnotesize
etex
prologues := 1;
beginfig(1);
  numeric pwd, pht, pdx;
  pwd = 110bp;
  pht = 110bp;
  pdy = .1*pht;
  spht = .6pht;

  pickup pencircle scaled .8bp;
  draw ( (0bp,0bp)--(2pwd,0bp)--(2pwd,spht)..{dir 190}(pwd,spht)..(0bp,spht)--cycle ) shifted (0bp,pht+pdy);
  draw ( (pwd,0bp)--(pwd,spht) ) shifted (0bp,pht+pdy);
  draw unitsquare xscaled 2pwd yscaled pht;
  draw (pwd,0bp)--(pwd,pht);
  draw ( (0bp,0bp)--(2pwd,0bp)--(2pwd,-spht)..{dir 190}(pwd,-spht)..(0bp,-spht)--cycle ) shifted (0bp,-pdy);
  draw ( (pwd,0bp)--(pwd,-spht) ) shifted (0bp,-pdy);

  label.top(btex left hand page etex, (.5pwd,spht) shifted (0bp,pht+2pdy));
  label.top(btex right hand page etex, (1.5pwd,spht) shifted (0bp,pht+2pdy));
  label.top(btex \parbox{100pt}{\itshape\dotfill\ running text \dotfill} etex, (1.5pwd,0bp) shifted (0bp,pht+pdy));
  label.rt(btex \begin{tabular}{@{}l@{}}page\\break\end{tabular} etex, (2pwd,0bp) shifted (.5pdy,pht+pdy));
  label.llft(btex \begin{tabular}[c]{@{}l@{}}called via\\\texttt{\textbackslash afterpage}\end{tabular} $\left\{\mathrm{\raisebox{-2\baselineskip}{\rule{0pt}{4\baselineskip}}}\right.$  etex, (0bp,pht) shifted (-.25pdy,0bp));
  label.bot(btex \parbox{100pt}{\ttfamily\textbackslash leftpagecontrolstart\par\textbackslash leftpagecontent\par\textbackslash leftpagecontrolend\par\textbackslash clearpage} etex, (.5pwd,pht));
  label.bot(btex \parbox{100pt}{\texttt{\textbackslash rightpagecontrolstart}\par\dotfill\ \textit{running text} \dotfill} etex, (1.5pwd,pht));
  label.top(btex \parbox{100pt}{\itshape\dotfill\ running text \dotfill} etex, (1.5pwd,0bp));
  label.rt(btex \begin{tabular}{@{}l@{}}page\\break\end{tabular} etex, (2pwd,0bp) shifted (.5pdy,0bp));
  label.llft(btex \begin{tabular}[c]{@{}l@{}}called via\\\texttt{\textbackslash afterpage}\end{tabular} $\left\{\mathrm{\raisebox{-2\baselineskip}{\rule{0pt}{4\baselineskip}}}\right.$ etex, (0bp,-pdy) shifted (-.25pdy,0bp));
  label.bot(btex \parbox{100pt}{\ttfamily\textbackslash leftpagecontrolstart\par\textbackslash leftpagecontent\par\textbackslash leftpagecontrolend\par\textbackslash clearpage} etex, (.5pwd,-pdy));
  label.bot(btex \parbox{100pt}{\texttt{\textbackslash rightpagecontrolstart}\par\dotfill\ \textit{running text} \dotfill} etex, (1.5pwd,-pdy));

  pickup pencircle scaled .4bp;
  drawarrow (.25pwd,pht-45pt){dir -45}..(.8pwd,pht-30pt)..{right}(.99pwd,.95pht);
  drawarrow ( (.25pwd,pht-45pt){dir -45}..(.8pwd,pht-30pt)..{right}(.99pwd,.95pht) ) shifted (0bp,-pht-pdy);
endfig;

end
\endinput
%%
%% End of file `figure.mp'.
