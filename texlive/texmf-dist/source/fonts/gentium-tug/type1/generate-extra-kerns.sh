#!/bin/sh
# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.

# Generates extra kerning pairs for Greek.
# GentiumBasic has no Greek, so no correction is needed.
#
# If you want to keep the files with extra kerning pairs,
# run just this script.

TTF_PATH="../../../../fonts/truetype/public/gentium-tug"
AFM_PATH="../../../../fonts/afm/public/gentium-tug"

for i in GentiumPlus-R.ttf GentiumPlus-I.ttf; do
  echo "----------------------------------------------"
  echo "* Generating extra kerns for $i"
  echo "* Converting font to sfd"
  FILE_TTF="$TTF_PATH/$i"
  FILE_SFD="$(basename $i .ttf).sfd"
  fontforge -lang=ff -c "Open('$FILE_TTF');Save('$FILE_SFD')" 
  echo "* Calculating the kerns"
  greekcorrection.py $(basename $i .ttf).sfd
  kerncorrection.py "$AFM_PATH/$(basename $i .ttf).afm" $(basename $i .ttf)-extra.afm
  cat $(basename $i .ttf)-Czech.kern >> $(basename $i .ttf)-extra.afm
done

rm *sfd
