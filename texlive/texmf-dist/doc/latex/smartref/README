Smartref package ReadMe

=====================================================================

This package is distributed under the terms of the LaTeX Project
Public License

=====================================================================

This is the readme for the LaTeX Package ``smartref'', version 1.82

The purpose of this package is to extend the capability of the
the \ref command; precisely, whenever a label is set, this
package records, along with the label, the values of some other
counters (which, can be selected by the user); then, the value of
these counters can be recalled, with a command similar to
\pageref; moreover, this package adds a command (\s<name>ref) for
each counter added, that displays something only if the value of
the <name> counter is changed from when the label is set. For
example, let's say that we are using the `amsbook' class, and we
are numbering theorems within sections; when we want to refer to
a theorem in another section, same chapter, we just say `as in
theorem \ref{zorn}'; but if we want to refer to a theorem in
another chapter, we have to set a label for that chapter and then
say `as in theorem \ref{zorn}, in chapter \ref{chapterofzorn}';
if we, later on, move the referenced theorem (or the referencing
line) in some other chapter, we might need to update the
references; with this package, there's no need for that: you say,
at the beginning of the document:

    \addtoreflist{chapter}

and then, every \label is recorded alongside with the chapter in
which it occurred. When we refer to the theorem, we might now say

    theorem \ref{zorn}, chapter \chapterref{zorn}

if we are sure it will always be in another chapter, or

    theorem \ref{zorn}\schapterref{zorn}

where the second command prints nothing if the chapter is the same
as the current, or prints `, chap. \chapterref{zorn}' if the chapter
has changed. Since this command sequence is supposed to be used with
quite a frequency, it is not-so-short-handed by \srefchapterref
(\sref<name>ref, in general).

Here's a complete list of the commands made available by this
package.

\addtoreflist{<name>}

This is the first command called: it says that the <name> counter
is to be recorded alongside with all the (following) labels;
please use it BEFORE defining any label, because the result is
unknown if the SmartReference list changes during use (nothing
special should happen, anyhow; it should work correctly).

The previous command defines a few commands, whose name depends
on the counter chosen. The commands are:

\sget<name>val{\variable}{foo}

This command gets the value of counter <name> recorded with label
`foo', and puts this value in the chosen \variable.

\<name>ref{foo}

This command prints the value of the counter <name> recorded with
label `foo'.

\if<name>changed

`If' construct for the next two commands:

\is<name>changed{foo}

Checks whether the <name> counter is changed from value recorded
with `foo', and sets \<name>changed accordingly

\s<name>ref{foo}

This command prints nothing if the value of <name> is not
different, but prints `, \short<name>name \<name>ref{foo}' if the
value did change; the \short<name>name should be defined by the
user. It queries by using the previous command.

\sref<name>ref{foo}

Equivalent of `\ref{foo}\s<name>ref{foo}'.


The only options accepted, as for now, are `chapter' and `part';

`chapter' does the following:

- adds the `chapter' counter to the smart list

- defines \shortchaptername to be `Cap.' if babel is loaded with
option `italian', `Chap.' otherwise

- defines \smartref to be \srefchapterref

`part' does the following:

- adds the `part' counter to the smart list

- defines \shortpartname to be `Parte' if babel is loaded with
option `italian', `Part' otherwise

- defines \smartref to be \srefpartref if previously undefined,
or adds \spartref to previous definition of \smartref (saved in
\nopart@smartref) otherwise (this is mainly to be used after the
option `chapter').

As of version 1.6, the package comes with a small style file:

byname.sty;

it can be used alone, or within smartref, when the option
`byname' is used; it adds the command

\byname{<label>}

that can be used when referencing to a section (subsection, etc) by
name instead of number. As of version 1.8, the same style file also
provides the command \byshortname that does the same as \byname,
except that it uses the "short" name (the one provided in square
brackets).

Note that the references create by smartref and byname are *not*
hyperlink, when hyperref is active. Maybe in the future ...

(You can still have "named" links with hyperref using the nameref
style file provided with hyperref itself).

=====================================================================

Please send me any bugs, comments, suggestions, hacks, etc etc
etc ...

Giuseppe Bilotta

Email: bourbaki@bigfoot.com

Heartily thanks to James Kilfiger (mapdn@csv.warwick.ac.uk) whose
consulence has been essential (let me say vital) to the birth of
this small package in its first revision (v0.1); it was him who
gave me the idea to hack the \label command, and then encouraged
me to put the newborn code in a package (and telling me how to do
it!); it was also him that pointed out a potential bug in
documents where chapters don't start on a page on their own
(seems that the bug is not present, anyway ...).

=====================================================================

TODOs:

BABEL: instead of \chaptername (for example), this package uses
\shortchaptername, and this is not yet changed by Babel; you can
set it up to your short form of chapter. Please send me the short
names, so that I can implement them.

Maybe put an option (`long') to make \short<name>name an alias for
\<name>name

Options: If the option is not recognized, check if it's a counter,
and add it; otherwise, do nothing

Smartrefs: check for counters that get reset by other counters
(section in chapter, etc); maybe link to the \@addtoreset
internal command ...

ByName: refine, and add commands to do both references with a single
command

=====================================================================

History:

v0.1  First release (only did chapter and part).
v1.0  First customizable release.
v1.1  Made it work with HyperRef.
v1.5  Added nameref.sty: reference by name.
v1.6  Changed name to byname.sty, because of name conflict with style
      file from the HyperRef bundle.
v1.8  Fixed bugs in smartref, changed behaviour for unknown options,
      fixed bug in byname that actually prevented it from functioning
      properly.
v1.9  Fixed limitation with AMS-LaTeX: would not handle \labels within
      equation because AMS-LaTeX redefines the \label command for
      equations.
      Made \smartref robust.
	 

