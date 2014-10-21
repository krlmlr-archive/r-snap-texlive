README for the rtkinenc package.

The rtkinenc package is functionally similar to the standard LaTeX
package inputenc -- both set up active characters so that input 
character outside 7-bit visible ASCII are converted to the 
corresponding LaTeX commands. The main difference lies in that 
rtkinenc allows the user to specify a fallback procedure to use 
when the text command corresponding to some input character isn't 
available. This is primarily useful for program listings and similar 
material where one doesn't want characters to disappear in the 
typesetting.

Names of commands in rtkinenc have been selected so that it can read 
inputenc encoding definition files, and the aim is that rtkinenc 
should be backwards compatible with inputenc. rtkinenc is not a new 
version of inputenc though, nor is it part of standard LaTeX.

For an example of how the extra features in rtkinenc might be used, 
see the tcldoc document class (in CTAN directory macros/latex/
contrib/supported/tcldoc).

Lars Hellstr\"om,
2000/12/20.
