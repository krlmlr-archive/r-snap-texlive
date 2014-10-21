=====================
Sections in this file
=====================
    PACKAGE
    DESCRIPTION
    HOWTO
    FILE LIST

=======
PACKAGE
=======
    name   : ktv-texdata
    require: LaTeX2e
    author : Ky` Anh (kyanh@inic.biz, kyanh@linuxmail.org)
    version: v05.34 (2003/10/06)

===========
DESCRIPTION
===========

    This package provides a simple way to use the TeX input files
    whose contents are all the numbered environments.

    This package is useful for the teachers of mathematics
    who often work with large libraries of exercises of mathematics.

MORE DETAILS

    Assume that you have an input file (named `foo.tex')
    that specifies 16 exercies
        
        % --- first line of `foo.tex'
        \begin{exercice}\label{ex:1}
              This is the first exercice.
        \end{exercice}
        %
        \begin{exercice}\label{ex:2}
              This is the second exercice.
        \end{exercice}
        %
        ...
        \begin{exercice}[*]\label{ex:16}
              This is the 16th exercice
              (with a star mark *).
        \end{exercice}
        % --- last line of `foo.tex'
    
    On Tuesday, for e.g., you want to create a student test
    that contains the first  8 exercises of the `foo.tex'.
    However, on Wednesday, you want to create another test
    that contains the last 8 exercises of the `foo.tex'.

    Of course, the simplest way to do that is `copying' and `pasting'.
    Of course, this way becomes too complex in case,
    for e.g., you need only the exercies that are numbered oddly
    (1, 3, 5, 7, 9, 11, 13, 15).
    
    You may think of a solution like this

        \getonly{1,2,3,4,5,6,7,8}        % on Tuesday
        \getonly{9,10,11,12,13,14,15,16} % on Wednesday
        \getonly{1,3,5,7,9,11,13,15}     % on Friday

    This pakage helps you
    

=====
HOWTO
=====

    1. Generate package and example

            latex ktv-texdata.ins

    2. Get an example / a test

            latex ktv-test.tex

    3. Report bugs and suggestions

            mailto: kyanh@inic.biz
            mailto: kyanh@linuxmail.org

=========
FILE LIST
=========

        0.  readme.txt              this file
        0.  readme                  this file
        1.  ktv-texdata .sty        the package
        2.  ktv-texdata .dvi        package (documentation) (DVI)
        3.  ktv-texdata .pdf        package (documentation) (PDF)
        4.  ktv-test    .dvi        test file (DVI)
        5.  ktv-test    .tex        test file (source)
        6.  ktv-data    .tex        test file (data file)
        7.  ktv-texdata .dtx        package (source file)
        8.  ktv-texdata .ktvnum     document build-number
        9.  ktv-texdata .ins        installation file
       10.  ktv-buildnum.sty        (optional tools)

===========
End of file
===========