#! /usr/bin/env python
# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.
# author: Pavel Farar, pavel.farar@centrum.cz
#
# This script generates extra kerning pairs for the
# combination accent + capital Greek letter. The kerning
# pairs will have such a value that the combination will
# look like the precomposed accented letter (with the
# exception of the left side bearing). The input must be
# a fontforge source (sfd file) and the output will have
# the same form as kerning pairs in the afm file
#
# The main idea is that the fontforge source contains the
# information how the accented letter is composed from the
# accent and the base letter. The relevant information is
# the width of the accent and the position of the accent
# and the base letter (how they are moved from the position
# X = 0). The kerning is computed using the following formula:
#
# Kern = X_letter - X_accent - WidthOfAccent
#
# This script is dirtier than it could be. The
# reason is that it should work with different fonts,
# but some fonts have problems. There is a problem
# with the letter Omega in GentiumPlus which has not
# the usual unicode value. In DejaVu the precomposed
# letters are composed sometimes as accent + letter,
# but sometimes also as letter + accent.

import sys

# Table with LIGKERNs for Greek capital letters, where
# first (accent) + second (letter) gives third (accented
# letter.  Well, probably not the best term, but I created
# the following table to a great extent automatically
# from the LIGKERN commands for the precomposed small Greek
# accented letters in the encoding LGR. Then I did uppercasing
# using information from Unicode and looked if there is
# some accented letter missing. Therefore I call it 
# LigatureTable and this file uses one line for every
# capital Greek letter. I did it in such a way to avoid
# random errors.
LigatureTable = []

LigatureTable.append(['uni1FBF', 'Alpha', 'uni1F08'])
LigatureTable.append(['uni1FBF', 'Epsilon', 'uni1F18'])
LigatureTable.append(['uni1FBF', 'Eta', 'uni1F28'])
LigatureTable.append(['uni1FBF', 'Iota', 'uni1F38'])
LigatureTable.append(['uni1FBF', 'Omicron', 'uni1F48'])
LigatureTable.append(['uni1FBF', 'Omega', 'uni1F68'])
LigatureTable.append(['uni1FFE', 'Alpha', 'uni1F09'])
LigatureTable.append(['uni1FFE', 'Epsilon', 'uni1F19'])
LigatureTable.append(['uni1FFE', 'Eta', 'uni1F29'])
LigatureTable.append(['uni1FFE', 'Iota', 'uni1F39'])
LigatureTable.append(['uni1FFE', 'Omicron', 'uni1F49'])
LigatureTable.append(['uni1FFE', 'Upsilon', 'uni1F59'])
LigatureTable.append(['uni1FFE', 'Omega', 'uni1F69'])
LigatureTable.append(['uni1FFE', 'Rho', 'uni1FEC'])
LigatureTable.append(['uni1FCD', 'Alpha', 'uni1F0A'])
LigatureTable.append(['uni1FCD', 'Epsilon', 'uni1F1A'])
LigatureTable.append(['uni1FCD', 'Eta', 'uni1F2A'])
LigatureTable.append(['uni1FCD', 'Iota', 'uni1F3A'])
LigatureTable.append(['uni1FCD', 'Omicron', 'uni1F4A'])
LigatureTable.append(['uni1FCD', 'Omega', 'uni1F6A'])
LigatureTable.append(['uni1FDD', 'Alpha', 'uni1F0B'])
LigatureTable.append(['uni1FDD', 'Epsilon', 'uni1F1B'])
LigatureTable.append(['uni1FDD', 'Eta', 'uni1F2B'])
LigatureTable.append(['uni1FDD', 'Iota', 'uni1F3B'])
LigatureTable.append(['uni1FDD', 'Omicron', 'uni1F4B'])
LigatureTable.append(['uni1FDD', 'Upsilon', 'uni1F5B'])
LigatureTable.append(['uni1FDD', 'Omega', 'uni1F6B'])
LigatureTable.append(['uni1FCE', 'Alpha', 'uni1F0C'])
LigatureTable.append(['uni1FCE', 'Epsilon', 'uni1F1C'])
LigatureTable.append(['uni1FCE', 'Eta', 'uni1F2C'])
LigatureTable.append(['uni1FCE', 'Iota', 'uni1F3C'])
LigatureTable.append(['uni1FCE', 'Omicron', 'uni1F4C'])
LigatureTable.append(['uni1FCE', 'Omega', 'uni1F6C'])
LigatureTable.append(['uni1FDE', 'Alpha', 'uni1F0D'])
LigatureTable.append(['uni1FDE', 'Epsilon', 'uni1F1D'])
LigatureTable.append(['uni1FDE', 'Eta', 'uni1F2D'])
LigatureTable.append(['uni1FDE', 'Iota', 'uni1F3D'])
LigatureTable.append(['uni1FDE', 'Omicron', 'uni1F4D'])
LigatureTable.append(['uni1FDE', 'Upsilon', 'uni1F5D'])
LigatureTable.append(['uni1FDE', 'Omega', 'uni1F6D'])
LigatureTable.append(['uni1FCF', 'Alpha', 'uni1F0E'])
LigatureTable.append(['uni1FCF', 'Eta', 'uni1F2E'])
LigatureTable.append(['uni1FCF', 'Iota', 'uni1F3E'])
LigatureTable.append(['uni1FCF', 'Omega', 'uni1F6E'])
LigatureTable.append(['uni1FDF', 'Alpha', 'uni1F0F'])
LigatureTable.append(['uni1FDF', 'Eta', 'uni1F2F'])
LigatureTable.append(['uni1FDF', 'Iota', 'uni1F3F'])
LigatureTable.append(['uni1FDF', 'Upsilon', 'uni1F5F'])
LigatureTable.append(['uni1FDF', 'Omega', 'uni1F6F'])
LigatureTable.append(['uni1FEF', 'Alpha', 'uni1FBA'])
LigatureTable.append(['uni1FEF', 'Epsilon', 'uni1FC8'])
LigatureTable.append(['uni1FEF', 'Eta', 'uni1FCA'])
LigatureTable.append(['uni1FEF', 'Iota', 'uni1FDA'])
LigatureTable.append(['uni1FEF', 'Omicron', 'uni1FF8'])
LigatureTable.append(['uni1FEF', 'Upsilon', 'uni1FEA'])
LigatureTable.append(['uni1FEF', 'Omega', 'uni1FFA'])
LigatureTable.append(['tonos', 'Alpha', 'Alphatonos'])
LigatureTable.append(['tonos', 'Epsilon', 'Epsilontonos'])
LigatureTable.append(['tonos', 'Eta', 'Etatonos'])
LigatureTable.append(['tonos', 'Iota', 'Iotatonos'])
LigatureTable.append(['tonos', 'Omicron', 'Omicrontonos'])
LigatureTable.append(['tonos', 'Upsilon', 'Upsilontonos'])
LigatureTable.append(['tonos', 'Omega', 'Omegatonos'])


# Set with Greek accents
GreekAccents = set()	# empty set
for i in range(len(LigatureTable)):
  GreekAccents.add(LigatureTable[i][0])

# Set with Greek letters
GreekLetters = set()	# empty set
for i in range(len(LigatureTable)):
  GreekLetters.add(LigatureTable[i][1])

# Set with precomposed Greek letters
PrecomposedGreekLetters = set()	# empty set
for i in range(len(LigatureTable)):
  PrecomposedGreekLetters.add(LigatureTable[i][2])


def UnicodeValue(s):
  # The unicode value is the second number after "Encoding:"
  if s.find('Encoding:') <> 0: sys.exit('UnicodeValue error')
  return s.split()[2]	# The third item


def WidthValue(s):
  if s.find('Width:') <> 0: sys.exit('WidthValue error')
  return s.split()[1]	# The second item


# Dictionaries (all values are strings, not numbers!)
AccentWidth = {}
AccentUnicode = {}
LetterUnicode = {}


# Process the components (accents and base letters)
f = open(sys.argv[1], 'r')
farray = f.readlines()
f.close()
findex = -1
while True:
  findex = findex + 1
  if findex >= len(farray): break	# end of file
  s = farray[findex]
  if s.find('StartChar: ') == 0 :
    CharacterName = s[11:-1]
    if CharacterName in GreekLetters:
      findex = findex + 1
      s = farray[findex]
      LetterUnicode[CharacterName] = UnicodeValue(s)
    if CharacterName in GreekAccents:
      findex = findex + 1
      s = farray[findex]
      AccentUnicode[CharacterName] = UnicodeValue(s)
      findex = findex + 1
      s = farray[findex]
      AccentWidth[CharacterName] = WidthValue(s)


def MoveValue(ss, lindex):
  sarray = ss.split()
  if sarray[0] <> 'Refer:': sys.exit('No Refer:')
  x = int(sarray[8])	# the value of move
  
  # dirty hack to make Omega work in both Gentium and GentiumPlus
  # This script without the following hack would work well for Gentium, but not for
  # GentiumPlus. The problem with GentiumPlus is that the accented letters with Omega
  # uses as a base letter that with the unicode value 937 (which should be Omega), but
  # this letter has PostScript name uni03A9, not Omega. Omega has a different value.
  if sarray[2] == '937': # the standard unicode value for Omega = problems in GentiumPlus
    sarray[2] = LetterUnicode['Omega']

  # is it accent or letter?
  # unicode is the second number (third value)
  if sarray[2] == AccentUnicode[LigatureTable[lindex][0]]: # accent
    x = -x	# the move of accent is taken negatively
  elif sarray[2] == LetterUnicode[LigatureTable[lindex][1]]: # letter
    x = +x	# the move of letter is taken positively
  else:
    sys.exit('Bad unicode of component')
    
  return x


def KernValue(letter, s1, s2):
  # letter	- the name of the precomposed letter
  # s1		- Refer to the accent (expected to be first)
  # s2		- Refer to the letter
  for i in range(len(LigatureTable)):
    if LigatureTable[i][2] == letter: LetterIndex = i
  
  FirstMove = MoveValue(s1, LetterIndex)  
  SecondMove = MoveValue(s2, LetterIndex)  

  return FirstMove + SecondMove - int(AccentWidth[LigatureTable[LetterIndex][0]])
  
  
  

KernTable = {} 

# Process the precomposed letters
# The sfd file is still in "farray"
findex = -1
while True:
  findex = findex + 1
  if findex >= len(farray): break	# end of file
  s = farray[findex]
  if s.find('StartChar: ') == 0 :
    CharacterName = s[11:-1]
    if CharacterName in PrecomposedGreekLetters:
      while s.find('Refer: ') <> 0 :
        findex = findex + 1
        s = farray[findex]
      KernTable[CharacterName] = KernValue(CharacterName, s, farray[findex + 1])


# Write the kerning table
fafm = open(sys.argv[1][:-4] + '-extra.afm', 'w')
for i in range(len(LigatureTable)):
  sourceKern = KernTable[LigatureTable[i][2]]
  if sourceKern != 0: # remove zero kerns
    fafm.write('KPX ' + LigatureTable[i][0] + ' ' + LigatureTable[i][1] + ' ' +
      str(int(round(1000.0 / 2048.0 * sourceKern))) + '\n')
fafm.close()
