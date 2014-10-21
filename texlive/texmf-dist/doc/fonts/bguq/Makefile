# This makefile installs bguq for a TeXLive system running
# on a Linux system.  The install-pfb-texlive target will 
# probably fail on non-TeXLive systems, and almost certainly
# fail on non-Unix systems
#
# $Id: Install.mk,v 1.1 2012/07/17 23:11:50 jjg Exp $

TEXMF = /usr/local/share/texmf

install : install-mf install-tex install-pfb-texlive

install-mf : $(MF)
	install -d $(TEXMF)/fonts/source/bguq
	for file in bguq*.mf ; do \
	  install -m 644 $$file $(TEXMF)/fonts/source/bguq/$$file ;\
	done

install-tex :
	install -d $(TEXMF)/fonts/tfm/bguq
	for file in bguq*.tfm ; do \
	  install -m 644 $$file $(TEXMF)/fonts/tfm/bguq/$$file ;\
	done
	install -d $(TEXMF)/tex/latex/bguq
	for file in U*.fd bguq.sty ; do \
	  install -m 644 $$file $(TEXMF)/tex/latex/bguq/$$file ;\
	done

install-pfb-texlive :
	install -d $(TEXMF)/tex/latex/bguq/
	install -m 644 bguq.cfg $(TEXMF)/tex/latex/bguq/bguq.cfg
	install -d $(TEXMF)/fonts/map/dvips/
	install -m 644 bguq.map $(TEXMF)/fonts/map/dvips/bguq.map
	install -d $(TEXMF)/fonts/type1/bguq
	for file in *.pfb ; do \
	  install -m 644 $$file $(TEXMF)/fonts/type1/bguq/$$file ;\
	done
	mktexlsr	
	cd /tmp ; updmap-sys --enable Map=bguq.map
