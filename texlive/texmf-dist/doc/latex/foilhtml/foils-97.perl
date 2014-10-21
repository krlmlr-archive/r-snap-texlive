######################################################
#
# generated with the docstrip utility.
#
# Copyright Boris Veytsman 1998
#
#  You are *not* allowed to modify this file.
#
#  You are *not* allowed to distribute this file.
# For distribution of the original source see
# the terms for copying and modification in the file
# foilhtml.dtx
#
 $FOILHEADLEVEL = 4 unless defined($FOILHEADLEVEL);
 %section_commands=('foilhead',$FOILHEADLEVEL,
   'rotatefoilhead',$FOILHEADLEVEL,%section_commands);

 %new_section_headings = ('foilhead', 'H1','rotatefoilhead','H1');
 &generate_new_sectioning_subs;

 sub generate_new_sectioning_subs{
    local($key, $val);
    while ( ($key, $val) = each %new_section_headings) {
        eval "sub do_cmd_$key {"
            . 'local($after) = @_;'
                . '&do_cmd_section_helper(' . $val . ');}';
        %section_commands=($key,$val,%section_commands);
    }
 };
 $FOILCLASS = 'article' unless defined $FOILCLASS;
 $FOILOPTIONS = '10pt' unless defined $FOILOPTIONS;
 sub make_latex{
 # This is the environment in which to process constructs that cannot be
 # translated to HTML.
 # The environment tex2html_wrap will be wrapped around any shorthand
 # environments (e.g. $, \(, \[).
 # The tex2html_wrap environment will be treated as an unrecognised
 # evironment by the translator and its contents (i.e. the 'shorthand'
 # environment) will be passed to latex for processing as usual.
     local($contents) = @_;
     local($preamble) = $preamble;
     local($preamble_aux) = $preamble_aux;
     # Make the @ character a normal letter ...
     $preamble =~
       s/\\documentclass.*/
       \\documentclass\[$FOILOPTIONS\]{$FOILCLASS}\\makeatletter/;
     # ... and make it special again after the preamble
     # remove the  \begin/\end  for  tex2html_nowrap and tex2html_deferred environments
     $preamble =~s/\\(begin|end)\s*\{(tex2html_(nowrap|deferred|nomath)[_a-z]*|imagesonly)\}//g;
     $preamble = "\\documentclass\{article\}%\\usepackage{html}%\n\\makeatletter"
         unless ($preamble);
     $preamble_aux = '' unless (($preamble_aux)&&($contents =~ /\\(hyper)?(ref|cite)/));

     local($paperwidth) = '';
     if ($PAPERSIZE) { $paperwidth = &adjust_textwidth($PAPERSIZE); }
     else { $paperwidth = &adjust_textwidth("a5"); }
     local($kern) = ($EXTRA_IMAGE_SCALE ? $EXTRA_IMAGE_SCALE/2 : ".5" );
     $kern = $kern * $MATH_SCALE_FACTOR;
     ($DEBUG ? "\\nonstopmode" : "\\batchmode") .
     "\n$preamble\n$preamble_aux\\makeatother\n" .
     "\\ifx\\AtBeginDocument\\undefined \\newcommand{\\AtBeginDocument}[1]{}\\fi\n" .
     "\\newenvironment{tex2html_wrap}{}{}\n" .
     "\\newbox\\sizebox\n" . "$paperwidth" .
     "\\newwrite\\lthtmlwrite\n" . "\\makeatletter\n" .
     "\\let\\realnormalsize=\\normalsize\n\\topskip=0pt\n\\def\\preveqno{}" .
     "\\let\\real\@float=\\\@float \\let\\realend\@float=\\end\@float\n" .
     "\\def\\\@float{\\let\\\@savefreelist\\\@freelist\\real\@float}\n" .
 #    "\\def\\\@float{\\\@dbflt}\n" .
     "\\def\\end\@float{\\realend\@float\\global\\let\\\@freelist\\\@savefreelist}\n" .
     "\\let\\real\@dbflt=\\\@dbflt \\let\\end\@dblfloat=\\end\@float\n" .
     "\\let\\\@largefloatcheck=\\relax\n" .
     "\\def\\\@dbflt{\\let\\\@savefreelist\\\@freelist\\real\@dbflt}\n" .
     "\\def\\adjustnormalsize{\\def\\normalsize{\\mathsurround=0pt \\realnormalsize" .
     "\\parindent=0pt\\abovedisplayskip=0pt\\belowdisplayskip=0pt}\\normalsize}\n" .
     "\\def\\lthtmltypeout#1{{\\let\\protect\\string\\immediate\\write\\lthtmlwrite{#1}}}%\n" .
     "\\newcommand\\lthtmlhboxmathA{\\adjustnormalsize\\setbox\\sizebox=\\hbox\\bgroup}%\n" .
     "\\newcommand\\lthtmlvboxmathA{\\adjustnormalsize\\setbox\\sizebox=\\vbox\\bgroup%\n".
     " \\let\\ifinner=\\iffalse }%\n" .
     "\\newcommand\\lthtmlboxmathZ{\\\@next\\next\\\@currlist{}{\\def\\next{\\voidb\@x}}%\n" .
 #    " \\expandafter\\box\\next\\edef\\next{\\egroup\\def\\noexpand\\thiseqn{\\theequation}}\\next}%\n" .
     " \\expandafter\\box\\next\\egroup}%\n" .
     "\\newcommand\\lthtmlmathtype[1]{\\def\\lthtmlmathenv{#1}}%\n" .
 #    "\\newcommand\\lthtmllogmath{\\lthtmltypeout{latex2htmlSize%\n" .
     "\\newcommand\\lthtmllogmath{\\lthtmltypeout{l2hSize %\n" .
     ":\\lthtmlmathenv:\\the\\ht\\sizebox::\\the\\dp\\sizebox::\\the\\wd\\sizebox.\\preveqno}}%\n" .
     "\\newcommand\\lthtmlfigureA[1]{\\let\\\@savefreelist\\\@freelist
        \\lthtmlmathtype{#1}\\lthtmlvboxmathA}%\n" .
     "\\newcommand\\lthtmlfigureZ{\\lthtmlboxmathZ\\lthtmllogmath\\copy\\sizebox
        \\global\\let\\\@freelist\\\@savefreelist}%\n" .
     "\\newcommand\\lthtmldisplayA[1]{\\lthtmlmathtype{#1}\\lthtmlvboxmathA}%\n" .
     "\\newcommand\\lthtmldisplayB[1]{\\edef\\preveqno{(\\theequation)}%\n" .
     "  \\lthtmldisplayA{#1}\\let\\\@eqnnum\\relax}%\n" .
     "\\newcommand\\lthtmldisplayZ{\\lthtmlboxmathZ\\lthtmllogmath\\lthtmlsetmath}%\n" .
     "\\newcommand\\lthtmlinlinemathA[1]{\\lthtmlmathtype{#1}\\lthtmlhboxmathA" .
     "  \\vrule height1.5ex width0pt }%\n" .
     "\\newcommand\\lthtmlinlinemathZ{\\egroup\\expandafter\\ifdim\\dp\\sizebox>0pt %\n" .
     "  \\expandafter\\centerinlinemath\\fi\\lthtmllogmath\\lthtmlsetmath}\n" .
     "\\def\\lthtmlsetmath{\\hbox{\\vrule width.5pt\\vtop{\\vbox{%\n" .
     "  \\kern.5pt\\kern$kern pt\\hbox{\\hglue.5pt\\copy\\sizebox\\hglue$kern pt}\\kern.5pt%\n" .
     "  \\ifdim\\dp\\sizebox>0pt\\kern$kern pt\\fi}%\n" .
     "  \\ifdim\\hsize>\\wd\\sizebox \\hrule depth1pt\\fi}}}\n" .
     "\\def\\centerinlinemath{\\dimen1=\\ht\\sizebox\n" .
     "  \\ifdim\\dimen1<\\dp\\sizebox \\ht\\sizebox=\\dp\\sizebox\n" .
     "  \\else \\dp\\sizebox=\\ht\\sizebox \\fi}\n\n" .
     "\\def\\lthtmlcheckvsize{\\ifdim\\ht\\sizebox<\\vsize\\expandafter\\vfill\n" .
     "  \\else\\expandafter\\vss\\fi}%\n" .
 #    "\\def\\\@enddocumenthook{\\ifnum\\count0>1 \\ifvoid\\\@cclv\\penalty-\\\@MM\\fi\\fi}\n" .
     "\\makeatletter\n" .
     $LaTeXmacros . "\n" .  # macros defined in extension files
 #    "\\usepackage{lthimages}\n" .
     "\n\\begin{document}\n" .
     "\\pagestyle{empty}\\thispagestyle{empty}%\n" .
     "\\lthtmltypeout{latex2htmlLength hsize=\\the\\hsize}%\n" .
     "\\lthtmltypeout{latex2htmlLength vsize=\\the\\vsize}%\n" .
     "\\lthtmltypeout{latex2htmlLength hoffset=\\the\\hoffset}%\n" .
     "\\lthtmltypeout{latex2htmlLength voffset=\\the\\voffset}%\n" .
     "\\lthtmltypeout{latex2htmlLength topmargin=\\the\\topmargin}%\n" .
     "\\lthtmltypeout{latex2htmlLength topskip=\\the\\topskip}%\n" .
     "\\lthtmltypeout{latex2htmlLength headheight=\\the\\headheight}%\n" .
     "\\lthtmltypeout{latex2htmlLength headsep=\\the\\headsep}%\n" .
     "\\lthtmltypeout{latex2htmlLength parskip=\\the\\parskip}%\n" .
     "\\lthtmltypeout{latex2htmlLength oddsidemargin=\\the\\oddsidemargin}%\n" .
     "\\makeatletter\n" .
     "\\if\@twoside\\lthtmltypeout{latex2htmlLength evensidemargin=\\the\\evensidemargin}%\n" .
     "\\else\\lthtmltypeout{latex2htmlLength evensidemargin=\\the\\oddsidemargin}\\fi%\n" .
     "\\makeatother\n" .
     "$contents\n".
 #    "\\clearpage\n" .
     "\\end{document}";
 }
 $DONT_INCLUDE = "foilhtml:".$DONT_INCLUDE;
&ignore_commands( <<_IGNORED_CMDS_);
portraitfoils
lanscapefoils
MyLogo # {}
Restriction # {}
LogoOff
LogoOn
rightfooter # {}
rightheader # {}
leftheader # {}
newnonfloat #{} #{}
foilheadskip # &ignore_numeric_argument
abovefloatskip # &ignore_numeric_argument
captionwidth # &ignore_numeric_argument
titleauthorskip # &ignore_numeric_argument
authorauthorskip # &ignore_numeric_argument
authordateskip # &ignore_numeric_argument
dateabstractskip # &ignore_numeric_argument
zerolistvertdimens
_IGNORED_CMDS_
 1; # This should be the last line
