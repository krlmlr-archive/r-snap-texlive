# creatdtx.perl LaTeX2HTML file corresponding to creatdtx.sty package
# author : Nicola Talbot
# date   : 2nd August 2007

package main;

print " [creatdtx v0.93b (N.L.C. Talbot)]";

sub do_cmd_meta
{
   &do_cmd_emph(@_);
}

sub do_cmd_cs{
  local($_) = @_;
  local($name);

  $name = &missing_braces unless
     (s/$next_pair_pr_rx/$name=$2;''/eo);

  "<TT>&#092;$name</TT>$_";
}

sub do_cmd_marg{
  local($_) = @_;
  local($arg);

  $arg = &missing_braces unless
     (s/$next_pair_pr_rx/$arg=$2;''/eo);

  "<TT>{</TT><EM>$arg</EM><TT>}</TT>$_";
}

sub do_cmd_oarg{
  local($_) = @_;
  local($arg);

  $arg = &missing_braces unless
     (s/$next_pair_pr_rx/$arg=$2;''/eo);

  "<TT>[</TT><EM>$arg</EM><TT>]</TT>$_";
}

sub do_cmd_parg{
  local($_) = @_;
  local($arg);

  $arg = &missing_braces unless
     (s/$next_pair_pr_rx/$arg=$2;''/eo);

  "<TT>(</TT><EM>$arg</EM><TT>)</TT>$_";
}

&ignore_commands( <<_IGNORED_CMDS_);
ifmakedtx # {}
StopEventually # {}
OnlyDescription
RecordChanges
PrintChanges
EnableCrossRefs
CodelineIndex
GetFileInfo # {}
CheckSum # {}
DescribeMacro # {}
DescribeEnvironment # {}
DoNotIndex # {}
changes # {} # {} # {}
DeleteShortVerb # {}
MakeShortVerb # {}
_IGNORED_CMDS_

1;
