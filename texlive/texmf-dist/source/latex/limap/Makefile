#******************************************************************************
#* $Id: Makefile 1.2 2000/03/01 20:11:42 gene Exp gene $
#******************************************************************************
#* Author: Gerd Neugebauer
#*=============================================================================

NAME		= limap
LATEX		= latex
MAKEINDEX	= makeindex


all: ${NAME}.cls ${NAME}.dvi

${NAME}.cls: ${NAME}.dtx ${NAME}.ins
	${RM} ${NAME}.cls ${NAME}.sty
	${LATEX} ${NAME}.ins

${NAME}.sty: ${NAME}.dtx ${NAME}.ins
	${RM} ${NAME}.cls ${NAME}.sty
	${LATEX} ${NAME}.ins

${NAME}.dvi: ${NAME}.dtx
	${LATEX} ${NAME}.dtx
	${MAKEINDEX} -s gind.ist ${NAME}
	${LATEX} ${NAME}.dtx

#------------------------------------------------------------------------------

ci:
	ci -l ${NAME}.dtx ${NAME}.ins Makefile
clean:
	${RM} ${NAME}.cls ${NAME}.sty


