README for the xdoc and docindex packages.

The standard LaTeX doc package is well-known to all LaTeX hackers. 
Without its support for the .dtx-file style of literate programming, 
the TeX world would probably be much more plagued by the horrors of
poorly commented and mysterious code than it is today. The past good 
decade that doc has been with us has been -- good. But even the sun 
has spots; doc is an old package and, as old code often tends to do, 
it breaks if you try to bend it into doing something new. The xdoc 
package is (or rather is meant to be) a rewrite from scratch 
which both can take a lot more bending and is ready for LaTeX2e*.

What exists so far is only xdoc2: the "second prototype" for the xdoc 
package. xdoc2 is not a complete rewrite of doc, but rather an add-on 
to doc which reimplements many of its mechanisms (more precisely those 
mechanisms which I think should be possible to "bend" into doing new 
things, but have found to be fixed to their present behaviour) and 
provides a few new features of its own. Even though xdoc2 is a 
prototype and some of the code in it is experimental, I consider it to 
be safe enough to build productive applications on, as I intend to 
keep xdoc2 available even after the final xdoc package is released.

Among the features of xdoc2 are:
  - new commands for describing things (cf. \DescribeMacro) and a
    package/class writer's interface for defining new such commands.
  - new environments for defining things in (cf. the macro 
    environment) and a package/class writer's interface for defining 
    new such environments.
  - support for two-sided document designs.
  - support for external cross-referencing.
  - improved sorting of macros, with support for defining prefixes
    that should be ignored when sorting.
  - support for CVS-style version numbering.
The other new features are of little interest to the mere user, but 
they may be ever so useful to those who are in the habit of hacking 
doc. Here we have for example:
  - basic commands implementing a robust "string" datatype.
  - an abstract command interface for making index entries;
    this would simplify supporting a different index sorting
    program.

Besides xdoc2, there are also the docindex/docidx2e packages. These 
provide mechanisms for a more flexible formatting of the index and list of 
changes than is possible with the mechanisms for this in the doc package. 
In particular docindex/docidx2e provides for automatic collapsing of 
trivial index levels, something which often happens in automatically 
generated multilevel indices such as the list of changes. The reason there 
are two packages is that docindex is a LaTeX2e* package, whereas docidx2e 
is a "downgraded" variant which runs on a normal LaTeX2e installation. 
Both do however follow the same internal logic.


The files in this directory are:

README.txt    - this file
docindex.dtx  - the source for the docindex and docidx2e packages
docindex.ins  - the docstrip installation script for the docindex and 
                docidx2e packages
xdoc2.dtx     - the source for the xdoc2 package
xdoc2.ins     - the docstrip installation script for the xdoc2 package
xdocdemo.tex  - a document which demonstrates some of the features in
                the xdoc2 package

2003/07/06,
Lars Hellstr\"om


