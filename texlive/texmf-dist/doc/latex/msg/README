%%
%% This is file `README_msg_doc.txt',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% msg.dtx  (with options: `README')
%% 
%%    File is part of the "msg" package for LaTeX
%%    which is designed to localize any LaTeX package
%%    or document class.
%% 
%% To unpack this package: latex msg.ins
%% To prepare for TeX Live: make TL
%%
%%                   HERE IS THE MSG PACKAGE FOR LaTeX
%%
%%  A LaTeX package to localize any package or document class.
%%
%%  A LaTeX package able to issue messages in the language provided as option
%%  of \documentclass or in use in the document (\languagename). All messages
%%  are identified with a unique "id" and stored in a MessagesFile whose name
%%  is related to the package and optionnaly to the language.
%%
%%  MessagesFile, name: [<language>]_<package>-msg.tex
%%            contents: \msg{<id>}{<message>}    % defines the message "id".
%%                      \msg*{<id>}{<message>}   % star form for msg emphasis.
%%                      \msg{*}{<error message>} % bad "id" default message.
%%    Messages can have 3 more parts defined asis:
%%                      \msg{<id>}{<msg>}[     % defines the msg first part.
%%                      \msgparti{<msg_part>}  % defines the msg second part.
%%                     \msgpartii{<msg_part>}  % defines the msg third part.
%%                    \msgpartiii{<msg_part>}] % defines the msg fourth part.
%%    Any message part can include a |#1| parameter provided from any
%%    of the macros below.
%%    Error messages have just a help more part as follows:
%%                      \msg{<id>}{<msg>}[     % defines the msg first part.
%%                        \help{<help_part>}]  % defines the help part.
%%    All messages should be fully expandable.
%%    Custolization:
%%                      \msgheader{<head part of messages>}
%%                      \msgtrailer{<final part of messages>}
%%                      \msgencoding{<encoding of messages>}% as for inputenc.
%%    Check "msg-msg.tex" file for msg's own messages file.
%%
%%  Document usage:  \documentclass[any_option]{any_class}
%%           call:      \usepackage[options,language]{msg}
%%
%%    to issue the message "id":    \issuemsg{<id>}(<package>)[#1]
%%       One can use any message macro (defaultly \typeout) with:
%%                   \issuemsg[msg_macro]{<id>}(<package>)[#1]
%%       Multi-parts message can't be issued through \issuemsg.
%%       One can specify the macro name to issue message as an option
%%          of \usepackage: \message, \wlog, \typeout, \kbtypyeout or
%%          \ClassWarning, \ClassError, \PackageWarning, \PackageError, ...
%%
%%    to retrieve the message "id" in \themsg (without typesetting):
%%                               \retrievemsg{<id>}(<package>)[#1]
%%       Multi-parts message will have defined also \themsgi,
%%                                                  \themsgii and \themsgiii.
%%    to get the message "id":        \getmsg{<id>}(<package>)[#1]
%%
%%    Usually, the requested message "id" is retrieved from
%%           [<language>]_<package>-msg.tex but if there is no active language
%%             or if file don't exist then message is searched in the
%%            <package>-msg.tex file.
%%
%%    For testing a messages file, you can code:
%%                   \issueallmsg[msg_macro](<package>)
%%            and all messages from the file will be retrieved and issued.
%%
%%    For tracing all accessed files you should load the "msg" package with
%%            the option: tracefiles.
%%
%%    In case of trouble you can ask the "msg" package not to load
%%            any message file, just load the "msg" package with the
%%            option: noop, and then you just obtain a message containing
%%            the "msgid".
%%
%% Please look at the documentations for more details.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~
%%   And any code from 128 to 255
%%  }
%%
\endinput
%%
%% End of file `README_msg_doc.txt'.
