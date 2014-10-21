# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.
#
# The build scripts for Type 1 fonts need some afm files already
# available. If new TTF files are released, it is best to keep the
# old Type 1 fonts, copy the new TTF files and run the scripts.
#
# Currently, the scripts first make additional kerning pairs from
# the existing afm files and then convert the fonts to Type 1 format
# using these additional kerning pairs. That means that you may need to
# run "make" twice to get stable result if you change some metrics in the
# script ff-gentium.pe. For example if you change the kern value for the
# pair DV, then the first run will change the value just for this pair and
# the second run will change the values also for all the derived pairs
# (accented letters, small caps).

AFM_PATH='../../../../fonts/afm/public/gentium-tug'
PFB_PATH='../../../../fonts/type1/public/gentium-tug'

all:	kerns
	ff-gentium.pe GentiumPlus-R.ttf GentiumPlus-I.ttf \
		GenBasB.ttf GenBasBI.ttf
	# Change the creator to "TeX Users Group"
	for I in *.pfb; do \
		t1disasm $$I | sed 's/%%Creator: .*/%%Creator: TeX Users Group/' \
		> gentium.disasm; \
		t1asm gentium.disasm $$I; \
		done
	for I in *.afm; do afmcreator.py $$I; done
	rm *-extra.afm
	rm *.otf *.sfd
	rm gentium.disasm
	mv -f *.afm $(AFM_PATH)
	mv -f *.pfb $(PFB_PATH)

# Generate extra kerning pairs (and keep them).
kerns:
	generate-extra-kerns.sh

# Run the generated Type 1 fonts through t1lint. When there is
# no error message, then the fonts are probably Ok.
test:
	for I in $(PFB_PATH)/*.pfb; do \
		t1lint $$I; \
		done
