#! /usr/bin/env python
# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.

import os, sys

creatortext = "Comment Creator: TeX Users Group\n"

tempname = "temp.afm"

fin = open(sys.argv[1], "r")
fout = open(tempname, "w")
while True:
  s = fin.readline()
  if s == "": break	# end of file
  fout.write(s)
  if s.find("Comment Creation Date") == 0 :
    fout.write(creatortext) # Creator after Creation Date
fin.close()
fout.close()

os.rename(tempname, sys.argv[1])
