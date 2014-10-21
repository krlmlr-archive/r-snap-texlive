README for eemenu and sourcetcl:
=====================================

eemenu is a package for the Alpha/Alphatk text 
editors. Among other things, it implements 
a command that makes it possible to evaluate 
all Tcl code in an open .dtx file window with 
a single keypress. For more information, run 
LaTeX on eemenu.dtx.

Running LaTeX on eemenu.ins generates the two
files
   eemenu.tcl
   eefor7menu.tcl
Both implement the same commands, but eemenu.tcl 
requires version 8 of the AlphaTcl library, 
whereas eefor7menu.tcl requires version 7.5 or 
7.6 of that library.

See http://alphatcl.sourceforge.net/ and the 
links there for more information about the 
Alpha/Alphatk text editors.



sourcedtx implements a Tcl command dtx::source 
that one can use to source Tcl code directly from
a .dtx file. To generate sourcetcl.tcl, run LaTeX 
on sourcetcl.ins. To typeset the documentation, 
run LaTeX on sourcetcl.dtx. To see an example of 
what it does, you can try the following commands 
in a Tcl shell:

   source sourcedtx.tcl
   dtx::source ../examples/pdf.dtx {pkg example1}

(It assumes the tclldoc/examples directory is a 
sibling of the current directory.) This should 
generate a file hello.pdf in the current 
directory, which contains a single page with the 
two words "Hello world!".



Lars Hellström,
20 July 2003
