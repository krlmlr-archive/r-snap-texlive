#!/bin/bash
# +AMDG

re="^drm([m|b|bx|c|sym]*)([n|it|sl|sc]*)([0-9]{1,2})$";
ifmath="mmi";
ifomx="omx";
ifmathsym="sy[0-9]";
font=$1;
fname="./drm";
fenc="T1";
commands="\\sample\\bye";
if [[ $font =~ $ifmath ]]; then
	fenc="OML";
	commands="\\table\\math\\bye";
fi
if [[ $font =~ $ifomx ]]; then
	fenc="OMX";
	commands="\\table\\math\\bye";
fi
if [[ $font =~ $ifmathsym ]]; then
	fenc="OMS";
	commands="\\table\\math\\bye";
fi
[[ $font =~ $re ]] && fweight="${BASH_REMATCH[1]}" &&
	fshape="${BASH_REMATCH[2]}" && fsize="${BASH_REMATCH[3]}";
if [[ $fshape == "" ]]; then
	fshape="m";
fi
if [[ $fweight == "" ]]; then
	fweight="n";
elif [[ $fweight == "sym" ]]; then
	fweight="n";
	fname="drmsym";
fi
#echo "fweight = $fweight; fshape = $fshape; fsize = $fsize";
nfssfontin=$(cat <<ENDFONTIN
$font
$commands
$fenc
$fname
$fweight
$fshape
$fsize
$commands
ENDFONTIN
)
echo $nfssfontin;

rm $1*pk; rm $1*gf;
mf "\mode=localfont; input $1";
gftopk $1.600gf $1.pk;
echo "$nfssfontin" | pdflatex nfssfont;
