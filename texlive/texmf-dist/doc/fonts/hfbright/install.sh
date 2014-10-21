PFB="pfb/hfbr10.pfb    pfb/hfbras8.pfb   pfb/hfbrbx10.pfb  pfb/hfbrsl10.pfb  \
    pfb/hfbrsy8.pfb   pfb/hfbr17.pfb    pfb/hfbras9.pfb   pfb/hfbrmb10.pfb  \
    pfb/hfbrsl17.pfb  pfb/hfbrsy9.pfb   pfb/hfbr8.pfb     pfb/hfbrbs10.pfb  \
    pfb/hfbrmi10.pfb  pfb/hfbrsl8.pfb   pfb/hfsltl10.pfb  pfb/hfbr9.pfb     \
    pfb/hfbrbs8.pfb   pfb/hfbrmi8.pfb   pfb/hfbrsl9.pfb   pfb/hftl10.pfb    \
    pfb/hfbras10.pfb  pfb/hfbrbs9.pfb   pfb/hfbrmi9.pfb   pfb/hfbrsy10.pfb"
AFM="afm/hfbr10.afm    afm/hfbras8.afm   afm/hfbrbx10.afm  afm/hfbrsl10.afm  \
    afm/hfbrsy8.afm   afm/hfbr17.afm    afm/hfbras9.afm   afm/hfbrmb10.afm  \
    afm/hfbrsl17.afm  afm/hfbrsy9.afm   afm/hfbr8.afm     afm/hfbrbs10.afm  \
    afm/hfbrmi10.afm  afm/hfbrsl8.afm   afm/hfsltl10.afm  afm/hfbr9.afm     \
    afm/hfbrbs8.afm   afm/hfbrmi8.afm   afm/hfbrsl9.afm   afm/hftl10.afm    \
    afm/hfbras10.afm  afm/hfbrbs9.afm   afm/hfbrmi9.afm   afm/hfbrsy10.afm"
DVIPS="dvips/config.hfbright  dvips/hfbright.map"

TEXMFMAIN=`kpsexpand '$TEXMFMAIN'`
TEXMFLOCAL=`kpsexpand '$TEXMFLOCAL'`
FONTS="$TEXMFLOCAL/fonts/type1/public/hfbright"
METRICS="$TEXMFLOCAL/fonts/afm/public/hfbright"
DVIPSDIR="$TEXMFLOCAL/dvips/config"

ALLESDA=true

echo "Test for existence of all files in »pfb/« and »dvips/«"
for a in $PFB $AFM $DVIPS
do
    if [ ! -f $a ]
    then
	ALLESDA=false
    fi
done

if [ "$ALLESDA" != "true" ]
then
    echo "Some files are missing: Generating them using »generate.sh«."
    echo ""
    echo "Now running »generate.sh«:"
    echo ""
    ./generate.sh
    echo ""
    echo "»generate.sh« is ready."
    echo ""
else
    echo "All files existing."
fi

echo "Installing files below »$TEXMFLOCAL/«"

echo "Path »$FONTS«"
if [ ! -d $FONTS ]
then
    echo "does not exist, creating it"
    mkdir -p $FONTS
else
    echo "already exists, reusing it (first clean it)"
    rm -f $FONTS/*
fi
echo "Copy »pfb/*« to »$FONTS«"
cp -f pfb/* $FONTS

echo "Path »$METRICS«"
if [ ! -d $METRICS ]
then
    echo "does not exist, creating it"
    mkdir -p $METRICS
else
    echo "already exists, reusing it (first clean it)"
    rm -f $METRICS/*
fi
echo "Copy »afm/*« to »$METRICS«"
cp -f afm/* $METRICS

echo "Path »$DVIPSDIR«"
if [ ! -d $DVIPSDIR ]
then
    echo "does not exist, creating it"
    mkdir -p $DVIPSDIR
else
    echo "already exists, reusing it"
fi
echo "Copy »dvips/*« to »$DVIPSDIR«"
cp -f dvips/* $DVIPSDIR

echo "Running »texhash« to update the TeX file database"
texhash

echo ""
echo "Now, you should add the line »Map hfbright.map« to the file »updmap.cfg« which"
echo "should be in »$TEXMFMAIN/web2c/« or"
echo "»$TEXMFLOCAL/web2c/«. Then, run »updmap«."
