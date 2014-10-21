README for the tclldoc package:
===============================

The purpose of the tclldoc package and class is to
simplify using the classical doc/docstrip style of
literate programming with Dr. John Ousterhout's 
Tool Command Language (Tcl, pronounced "tickle", 
a.k.a. The Cool Language). The tclldoc package is 
a bit like the doc package is for LaTeX, whereas 
the tclldoc class more parallels the ltxdoc class.

tclldoc.dtx contains an introduction to how one 
uses the .dtx file format for writing Tcl code.

The tclldoc class uses the tclldoc package for most
of its functionality. The tclldoc package depends 
on the xdoc2 and docidx2e packages for some of its
functionality. The latter two packages can be found
in the CTAN directory
   macros/latex/contrib/xdoc

The tools subdirectory of this directory contains 
two tools that you may find useful complements to
the tclldoc package. Both are Tcl scripts that make
it possible to source Tcl code stored in a .dtx file 
without using docstrip to generate any .tcl file in
between. Naturally, they are both distributed as
pairs of .dtx and .ins files, so they can also be 
used as examples of using the tclldoc package.

The examples subdirectory of this directory contains
two more examples of Tcl packages written in the 
doc/docstrip style of literate programming. One is
a package for writing PDF files, the other a package
for parsing Tcl scripts.

The LaTeX Project Public License applies for the 
tclldoc package and class, as well as to all the 
examples provided in the tools and examples folders.

More information about Tcl can be found on
http://www.tcl.tk/

Lars Hellström,
20 July 2003
