######################################################
#
# This is file `foilhtml.perl',
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
    # Make the @ character a normal letter ...
    $preamble =~
      s/\\documentclass.*/
      \\documentclass\[$FOILOPTIONS\]{$FOILCLASS}\\makeatletter/;
    # ... and make it special again after the preamble
    ($DEBUG ? "\\nonstopmode" : "\\batchmode") .
    "\n$preamble\n\\makeatother\n" .
    "\\newenvironment{tex2html_wrap}{}{}\n" .
    "\\newwrite\\lthtmlwrite\n" .
    "\\def\\lthtmltypeout#1%\n" .
    "{{\\let\\protect\\string\\immediate\\write\\lthtmlwrite{#1}}}%\n" .
    "\\newbox\\sizebox\n" .
    # "\\textheight 250cm\n" .
    "\\begin{document}\n" .
    "\\pagestyle{empty}\n" .
    "$contents\n".
    "\\end{document}";
 }
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
