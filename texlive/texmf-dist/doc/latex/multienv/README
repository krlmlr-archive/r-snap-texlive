LaTeX package 'multienv'
========================
Copyright (c) 2012 by Martin Scharrer <martin@scharrer-online.de>  
CTAN: <http://www.ctan.org/pkg/multienv>  
Code repository: <https://bitbucket.org/martin_scharrer/multienv>

This package provides a multienv environment which allows to easily
add multiple environments using a key=value syntax. Macros to define
environments using this syntax are also provided.

Example:
--------

The following 'multienv' environment:

    \begin{multienv}{enva,envb=arg,add code={code before}{code after},
        envc=[oarg]{marg}}
      content
    \end{multienv}

is basically identical to:

    \begin{enva}
      \begin{envb}{arg}
        code before
        \begin{enc}[oarg]{marg}
          content
        \end{enc}
        code after
      \end{envb}
    \end{enva}

except that actually the "plain" form together with explicit groups
is used: \begingroup\enva .. \endenva\endgroup.

