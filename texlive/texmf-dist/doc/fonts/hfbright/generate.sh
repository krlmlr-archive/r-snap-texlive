#!/bin/bash
# Script for automatic generation of hfbright fonts
# Version 0.6, 2002/11/22
#
# ----------------------------------------------------------

function prepare()
{
    echo 'Delete old logfile'
    rm -f $LOGFILE

    echo 'Generation started at '`date`
    echo 'Generation started at '`date` >> $LOGFILE

    # test mftrace version
    if ! mftrace --version >/dev/null 2>/dev/null
    then
	echo '»mftrace« not available. Aborting.' >&2
	echo '»mftrace« not available. Aborting.' >> $LOGFILE
	exit 1
    fi
    V1=`mftrace --version | sed s/'.* \([0-9]\)*\.\([0-9]*\)\.\([0-9]*\)'/'\1'/`
    V2=`mftrace --version | sed s/'.* \([0-9]\)*\.\([0-9]*\)\.\([0-9]*\)'/'\2'/`
    V3=`mftrace --version | sed s/'.* \([0-9]\)*\.\([0-9]*\)\.\([0-9]*\)'/'\3'/`
    if (( $V1<1 ))
    then
	echo "»mftrace« 1.0.12 or newer needed. Installed is `mftrace --version`." >&2
	echo "»mftrace« 1.0.12 or newer needed. Installed is `mftrace --version`." >> $LOGFILE
	exit 1
    fi
    if (( $V1==1 && $V2<0 ))
    then
	echo "»mftrace« 1.0.12 or newer needed. Installed is `mftrace --version`." >&2
	echo "»mftrace« 1.0.12 or newer needed. Installed is `mftrace --version`." >> $LOGFILE
	exit 1
    fi
    if (( $V1==1 && $V2==0 && $V3<12 ))
    then
	echo "»mftrace« 1.0.12 or newer needed. Installed is `mftrace --version`." >&2
	echo "»mftrace« 1.0.12 or newer needed. Installed is `mftrace --version`." >> $LOGFILE
	exit 1
    fi

    echo 'Prepare directories for generation'

    echo 'Create directory »work« if not already present' >> $LOGFILE
    test -d work || mkdir work

    echo -n 'Create or clean directories:' >> $LOGFILE
    for DIR in pfb pfa dvips afm
    do
	echo -n " »$DIR«" >> $LOGFILE
	if [ -d $DIR ]
	then
	    rm -rf $DIR
	fi
	mkdir $DIR
    done
    echo '' >> $LOGFILE

    echo 'Enter directory »work/«' >> $LOGFILE
    cd work
    echo 'Clean the directory' >> $LOGFILE
    rm -f *

# Generation of symbolic links seems not to be necessary since »mftrace«
# searches the TeX path. I'm not sure if »./xbbold.mf« is found.
# 
#    echo 'Generate symbolic links to all files in directory' >> $LOGFILE
#    echo "    »"`kpsexpand '$TEXMFMAIN'`"/fonts/source/public/cmbright/«" >> $LOGFILE
#    ln -s `kpsexpand '$TEXMFMAIN'`/fonts/source/public/cmbright/* .

    # 2002/11/14: Fix xbbold.mf, suggestions by 
    #             Felix Neubauer, (felix.neubauer@gmx.net) and
    #             Walter Schmidt (was@vr-web.de)
    echo "Copy and patch the file" >> $LOGFILE
    echo "    »"`kpsexpand '$TEXMFMAIN'`"/fonts/source/ams/symbols/xbbold.mf«" >> $LOGFILE
    sed s-'^if pixels_per_inch\*designsize < 1500:'-'if pixels_per_inch < 1500/designsize:'-g \
        `kpsexpand '$TEXMFMAIN'`/fonts/source/ams/symbols/xbbold.mf > xbbold.mf
}

# ----------------------------------------------------------

# $1   font name
# $2   encoding
# $3   FullName
# $4   Weight
# $5   ItalicAngle
# $6   isFixedPitch
# $7   UniqueID
#
# Most work is done by mftrace and pfaedit, but some things can't:
# - Set the UniqueID: pfaedit cannot set it in the Private dictionary
# - Set the Version: pfaedit seems not to do it
# - Set ItalicAngle: pfaedit does only integer values
# - Set isFixedPitch: pfaedit seems not to do it
function fontgen()
{
    INPUT='cm'$1
    OUTPUT='hf'$1
    FONTNAME=`echo $OUTPUT | sed -e y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/`

    echo "Create font »$FONTNAME«"
    echo -e "\nCreate font »$FONTNAME«" >> $LOGFILE

    echo "Trace Metafont $INPUT.mf, create file »$INPUT.pfa«" >> $LOGFILE
    mftrace $TRACEOPT --encoding=../$2.enc $INPUT >> $LOGFILE 2>&1

    echo "Create »$OUTPUT.pfa« and »$OUTPUT.afm«" >> $LOGFILE
    ../simplify-rename.pe $INPUT `kpsewhich $INPUT.tfm` $OUTPUT \
	    "$FONTNAME" "$3" "$4" >> $LOGFILE 2>&1

    echo "Set UniqueID, Version, ItalicAngle, and FixedPitch in" >> $LOGFILE
    echo "    »$OUTPUT.pfa« and »$OUTPUT.afm«" >> $LOGFILE
    t1disasm tmp.pfa \
    | sed -e s_'\(%!PS-AdobeFont.*\) 001.001'_"\1 $VERSION"_ \
	-e s_'\(/version *(\)001.001'_"\1$VERSION"_ \
	-e s_'\(/UniqueID get\) [0-9]* \(eq\)'_"\1 $7 \2"_ \
	-e s_'\(/UniqueID\) [0-9]* \(def\)'_"\1 $7 \2"_ \
	-e s_'\(/ItalicAngle\).*\(def\)'_"\1 $5 \2"_ \
	-e s_'\(/isFixedPitch\).*\(def\)'_"\1 $6 \2"_ \
    | t1asm -a > $OUTPUT.pfa
    cat tmp.afm \
    | sed -e s_'^\(Version *\)001.001'_"\1$VERSION"_ \
	-e s_'^\(ItalicAngle\).*'_"\1 $5"_ \
	-e s_'^\(isFixedPitch\).*'_"\1 $6"_ \
    > $OUTPUT.afm

    echo "Convert »$OUTPUT.pfa« to »$OUTPUT.pfb«" >> $LOGFILE
    t1binary $OUTPUT.pfa $OUTPUT.pfb

    echo "Delete temporary files" >> $LOGFILE
    rm -f $INPUT.pfa tmp.pfa tmp.afm
}

# ----------------------------------------------------------

function cmbright()
{

    fontgen br8  hfot1 "Computer Modern Bright" \
	    "Regular" 0 false 4214376
    fontgen br9  hfot1 "Computer Modern Bright" \
	    "Regular" 0 false 4214377
    fontgen br10 hfot1 "Computer Modern Bright" \
	    "Regular" 0 false 4214378
    fontgen br17 hfot1 "Computer Modern Bright" \
	    "Regular" 0 false 4214379

    fontgen brsl8  hfot1 "Computer Modern Bright Slanted" \
	    "Regular" -12 false 4214380
    fontgen brsl9  hfot1 "Computer Modern Bright Slanted" \
	    "Regular" -12 false 4214381
    fontgen brsl10 hfot1 "Computer Modern Bright Slanted" \
	    "Regular" -12 false 4214382
    fontgen brsl17 hfot1 "Computer Modern Bright Slanted" \
	    "Regular" -12 false 4214383

    fontgen brbx10 hfot1 "Computer Modern Bright Bold Extended" \
	    "Bold" 0 false 4214384

    fontgen tl10 hfot1 "Computer Modern Typewriter Light" \
	    "Regular" 0 true 4214385

    fontgen sltl10 hfot1 "Computer Modern Typewriter Light Slanted" \
	    "Regular" -9.46 true 4214386

    fontgen brmi8  hfmital "Computer Modern Bright Math Slanted" \
	    "Regular" -12 false 4214387
    fontgen brmi9  hfmital "Computer Modern Bright Math Slanted" \
	    "Regular" -12 false 4214388
    fontgen brmi10 hfmital "Computer Modern Bright Math Slanted" \
	    "Regular" -12 false 4214389

    fontgen brmb10 hfmital "Computer Modern Bright Math Slanted Bold" \
	    "Bold" -12 false 4214390

    fontgen brsy8  hfmsym "Computer Modern Bright Math Symbols" \
	    "Regular" -14.04 false 4214391
    fontgen brsy9  hfmsym "Computer Modern Bright Math Symbols" \
	    "Regular" -14.04 false 4214392
    fontgen brsy10 hfmsym "Computer Modern Bright Math Symbols" \
	    "Regular" -14.04 false 4214393

    fontgen bras8  hfmsa "Computer Modern Bright MSA Symbols" \
	    "Regular" 0 false 4214394
    fontgen bras9  hfmsa "Computer Modern Bright MSA Symbols" \
	    "Regular" 0 false 4214395
    fontgen bras10 hfmsa "Computer Modern Bright MSA Symbols" \
	    "Regular" 0 false 4214396

    fontgen brbs8  hfmsb "Computer Modern Bright MSB Symbols" \
	    "Regular" 0 false 4214397
    fontgen brbs9  hfmsb "Computer Modern Bright MSB Symbols" \
	    "Regular" 0 false 4214398
    fontgen brbs10 hfmsb "Computer Modern Bright MSB Symbols" \
	    "Regular" 0 false 4214399
}

# ----------------------------------------------------------

function latexstuff()
{
    echo "Generate fontmap and dvips config file"

    echo "Generate fontmap »hfbright.map«" >> $LOGFILE
    # Generate fontmap
    grep FontName *.pfa | sed s_'hf\(.*\).pfa:/FontName /\(.*\) def'_'cm\1 \2 <hf\1.pfb'_ > hfbright.map

    echo "Generate dvips config file »config.hfbright«" >> $LOGFILE
    # Generate config file
    echo 'p +hfbright.map' > config.hfbright
}

# ----------------------------------------------------------

function postwork()
{
    echo "Move generated files to their directories"

    echo "Move pfb files to »pfb/«" >> $LOGFILE
    mv *.pfb ../pfb
    echo "Move pfa files to »pfa/«" >> $LOGFILE
    mv *.pfa ../pfa
    echo "Move afm files to »afm/«" >> $LOGFILE
    mv *.afm ../afm
    echo "Move »hfbright.map« and »config.hfbright« to »dvips/«" >> $LOGFILE
    mv hfbright.map config.hfbright ../dvips
    echo "Clean »work/«" >> $LOGFILE
    rm -f *
    echo "Leave directory »work/«" >> $LOGFILE
    cd ..
    echo "Delete directory »work/«" >> $LOGFILE
    rmdir work

    echo 'Generation ready at '`date`
    echo 'Generation ready at '`date` >> $LOGFILE
}


# ----------------------------------------------------------

function help()
{
    echo "hfbright v$VERSION, $PROGDATE" >&2
    echo '' >&2
    echo 'Script for automatic generation of the hfbright type1 fonts.' >&2
    echo 'This script needs to find the files »hfmsa.enc«, »hfmsb.enc«,' >&2
    echo '»hfmital.enc«, »hfmsym.enc«, »hfot1.enc«, and »simplify-rename.pe«' >&2
    echo 'in the working directory.' >&2
    echo 'It creates the subdirectories »pfa«, »pfb«, and »dvips« where it' >&2
    echo 'puts the generated files.' >&2
    echo 'For installation, see README resp. use »install.sh«.' >&2
    echo '' >&2
}

# ----------------------------------------------------------
# Main programme

LOGFILE=$PWD/hfbright.log
VERSION=0.6
PROGDATE=2002/11/22
# 2002-11-20 v0.5: Added afm generation by mftrace
# 2002-11-21 v0.6: Removed again since it is done later by calling pfaedit
#                  explicitly
# TRACEOPT="--simplify --afm"

if [ "$1" == "--help" -o "$1" == "-h" ]
then
    help
    exit 1
fi

prepare
cmbright
latexstuff
postwork

# ----------------------------------------------------------
