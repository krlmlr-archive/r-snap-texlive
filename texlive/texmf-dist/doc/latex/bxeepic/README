BXeepic Package
===============

LaTeX: Reimplementation of epic/eepic features using pict2e engine

The eepic package (authored by Conrad Kwok) is one of packages to
provide small-size extention to the picture environment of LaTeX
(and epic package) and employs the tpic drawing feature of DVI-wares.
Back in 1990--2000 the use of epic + eepic was widespread because
many of the legacy DVI-wares (dvips, dvipdfmx, etc.) support tpic
(and thus eepic extension). But pdfTeX engine has never supported
tpic. As consequence, the use of epic + eepic was gradually replaced
by pict2e as pdfTeX became more popular.

In most cases drawings using epic + eepic are easily converted to
pict2e ones, but there are features that eepic supports but pict2e
does not --- e.g. ellipsis, dashed line. The present package provides
almost full features of epic + eepic implemented on pict2e engines.
Thus one can make epic + eepic drawings work on pdfTeX; moreover,
one can use eepic and pict2e in the same document.

### Installation

  - `*.sty`, `*.def` → $TEXMF/tex/latex/bxeepic

### Usage

Load this package after loading pict2e.

    \usepackage[<pict2e options>]{pict2e}
    \usepackage{bxeepic}

If pict2e is not yet loaded in loading bxeepic then it is loaded
automatically, and in this case every option given to bxeepic will
be passed to pict2e.

    \usepackage[<pict2e options>]{bxeepic}

This package provides all commands of epic and eepic packages, except
the following:

  - Shading: `\blacken`, `\whiten`, `\shade`, `\texture`, `\filltype`
  - Dashed line with dotted dashes: the second optional argument of
    `\dashline` is ignored.
  - Dotted line with user-defined dots: the optional argument of
    `\dottedline` is ignored.

### Notice

  - When behavior of a command differs btween eepic and epic, then
    that of eepic is adopted.
  - When behavior of a command differs btween pict2e and eepic, then
    that of pict2e is adopted.
  - However, `\arc` command can be used either in pict2e or eepic
    syntax; when it looks like `\arc{...}{...}{...}` then eepic syntax
    is assumed.
  - When bxeepic is loaded, both epic and eepic packages are marked
    as ‘already-loaded’; so one can load bxeepic earlily and then
    the packages that rely on epic and eepic will work happily.

Revision History
----------------

  * Version 0.2 <2013/04/28>
      - The bxdpxp2e module, which provides proper support for
        dvipdfmx, was abolished because the recent pic2e (>=v0.2y)
        has the support.
      - Documentation.
  * Version 0.1 <2010/08/08>
      - The first public version.

--------------------
Takayuki YATO (aka. "ZR")  
http://zrbabbler.sp.land.to/
