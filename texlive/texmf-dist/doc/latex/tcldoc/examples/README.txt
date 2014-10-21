README for the parsetcl and writepdf packages:
==============================================

The parsetcl package implements basic parsing
of Tcl scripts, and is written completely in
Tcl. To generate parsetcl.tcl, run LaTeX on
parsetcl.ins. To typeset the documentation, 
run LaTeX on parsetcl.dtx. To see an example
of what it does, you can try the following 
commands in a Tcl shell:

   source parsetcl.tcl
   auto_load parray
   set tree [parsetcl::simple_parse_script [info body parray]]
   parsetcl::format_tree $tree {} {   }

The tree variable will be set to a parser tree
for the body of the parray procedure. The last 
command reformats this tree (mostly replacing 
whitespace between list elements) to make the 
structure more visible.


The writepdf package is written completely in 
Tcl and provides basic commands for writing 
well-formed PDF files. To generate writepdf.tcl, 
run LaTeX on pdf.ins. To typeset the 
documentation, run LaTeX on pdf.dtx. To see an 
example of what it does, you can try the following 
commands in a Tcl shell:

   source writepdf.tcl
   source hellopdf.tcl

This will generate a file hello.pdf that contains
a single page with the two words "Hello world!".


Lars Hellström,
20 July 2003
