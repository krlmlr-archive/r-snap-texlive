.SUFFIXES: .300gf .329gf .360gf .432gf .518gf .622gf .mf


# the following three items should be modified for local conditions
TEXFONTS=. /b/local/lib/tex/fonts
MFLIB=/b/local/lib/mf
MFINPUTS=.\:$(MFLIB)/inputs\:$(MFLIB)/bases

FILES = cmph5.300gf cmph6.300gf cmph7.300gf cmph8.300gf cmph9.300gf \
	cmph10.300gf cmph10.329gf cmph10.360gf cmph10.432gf cmph10.518gf\
	cmph10.622gf
IFILES =  cmphi10.300gf cmphi9.300gf cmphi8.300gf \
	cmphi7.300gf cmphi10.329gf cmphi10.360gf cmphi10.432gf cmphi10.518gf\
	cmphi10.622gf
ROMAN = phosym.mf phochar.mf symchar.mf 
ITALIC = phoital.mf phoitchar.mf 
DEPENDANTS = $(ROMAN) $(ITALIC)
ALLFILES = phosym.mf phochar.mf symchar.mf phoital.mf phoitchar.mf \
	cmph5.mf cmph6.mf cmph7.mf cmph8.mf cmph9.mf cmph10.mf \
	cmphi7.mf cmphi8.mf cmphi9.mf cmphi10.mf \
	README makefile local.mf Doc/phonetic.sty Doc/phonetic-table.tex

# fonts are created and moved to the subdirectory fonts

all: cmph cmphi

cmph: $(ROMAN)
	make $(FILES)  "DEPENDANTS=$(ROMAN)"

cmphi: $(ITALIC)
	make $(IFILES)  "DEPENDANTS=$(ITALIC)"


# if you have mf working correctly (i.e., you don't need to load
# local.mf each time), you should modify the following.

.mf.300gf: $*.mf $(DEPENDANTS)
	mf "\mode:=imagen;"  "batchmode;" input $*

.mf.329gf: $*.mf $(DEPENDANTS)
	mf "\mode:=imagen;" "mag:=magstep 0.5;"  "batchmode;" input $*

.mf.360gf: $*.mf phosym.mf phochar.mf symchar.mf 
	mf "\mode:=imagen;" "mag:=magstep 1;" "batchmode;" input $*

.mf.432gf: $*.mf phosym.mf phochar.mf symchar.mf 
	mf "\mode:=imagen;" "mag:=magstep 2;" "batchmode;" input $*

.mf.518gf: $*.mf phosym.mf phochar.mf symchar.mf 
	mf "\mode:=imagen;" "mag:=magstep 3;" "batchmode;" input $*

.mf.622gf: $*.mf phosym.mf phochar.mf symchar.mf 
	mf "\mode:=imagen;" "mag:=magstep 4;" "batchmode;" input $*

# 

shar: 
	shar $(ALLFILES) > Phonetic.shar1
	sed '$$ a\
	mkdir fonts' Phonetic.shar1 > Phonetic.shar
	rm Phonetic.shar1

tar: 
	tar chf Phonetic.tar $(ALLFILES) fonts


