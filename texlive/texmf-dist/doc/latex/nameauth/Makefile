engine ?= pdflatex	# Override on the command line
			# with engine=latex
			# or with engine=xelatex
			# or with engine=lualatex.
			# If with lualatex, then use the fullpdf target.

# The default builds the distribution uploaded to CTAN.
dist:		pdf clean

# Making this target includes the code listing
fullpdf	:	sty
		$(engine) nameauth.dtx
		makeindex -s gglo.ist -o nameauth.gls nameauth.glo
		makeindex -s gind.ist -o nameauth.ind nameauth.idx
		$(engine) nameauth.dtx
		$(engine) nameauth.dtx

# This target omits the code listing.
pdf	:	sty
		$(engine) -draftmode "\AtBeginDocument{\OnlyDescription} \input nameauth.dtx"
		makeindex -s gglo.ist -o nameauth.gls nameauth.glo
		makeindex -s gind.ist -o nameauth.ind nameauth.idx
		$(engine) "\AtBeginDocument{\OnlyDescription} \input nameauth.dtx"
		$(engine) "\AtBeginDocument{\OnlyDescription} \input nameauth.dtx"

# Build the package.
sty	:	nameauth.dtx nameauth.ins
		$(engine) nameauth.ins

# Instead of using the shell to see if files exist, take advantage of rm.
clean	:
		rm -f nameauth.aux
		rm -f nameauth.glo
		rm -f nameauth.gls
		rm -f nameauth.idx
		rm -f nameauth.ilg
		rm -f nameauth.ind
		rm -f nameauth.log
		rm -f nameauth.out
		rm -f nameauth.toc
		rm -f nameauth.hd
		rm -f nameauth.top
		rm -f texput.*

# Remove all but the barest source files.
clobber	:	clean
		rm -f nameauth.dvi
		rm -f nameauth.pdf
		rm -f nameauth.sty
		touch nameauth.*


