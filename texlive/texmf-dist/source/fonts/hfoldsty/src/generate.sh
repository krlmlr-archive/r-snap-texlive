#!/bin/sh
#
# hfoldsty v1.15: A package for using oldstyle numerals with the ec fonts with
#                 better kerning for quillemets
#
# For use with ec fonts (European Computer Modern fonts by J"org Knappen
# <knappen@vkpmzd.kph.uni-mainz.de>, CTAN:/fonts/ec)
#
# Much code is taken from the eco fonts by
# Sebastian Marius Kirsch <skirsch@t-online.de>
#
#Copyright (C) 2003--2005, 2012  Harald Harders <harald.harders@gmx.de>
#
#This program is free software; you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation; either version 2 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#This Bourne shell script requires the following programs:
# - tftopl, vptovf
# - ed, sed
# - TeX, fontinst >= 1.926
# - a shell which supports here-documents (i.e. bash)
# - a TeX with kpathsea (i.e. teTeX) 
#
# See ChangeLog for package history.

VERSION=1.15
DATE=2012/01/01

size="0500 0600 0700 0800 0900 1000 1095 1200 1440 1728 2074 2488 2986 3583"
# Change v0.2: Use lining figures with small capitals.
# Change v0.4: Use old-style figures with small capitals again.
family="rm ti ui sl rb bx bl bi ss si sx so tt st it vt vi dh cc xc sc oc tc"
#family="rm ti ui sl rb bx bl bi ss si sx so tt st it vt vi dh"

kpsewhich=kpsewhich

logfile=./hfofonts.log

# Change v0.2: Use lining figures with small capitals.
# Change v0.4: Use old-style figures with small capitals again.
rofamily="rm ti ui sl rb bx bl bi cc xc sc oc"
#rofamily="rm ti ui sl rb bx bl bi"
#rfamily="m/sc bx/sc"

# Change v0.2: Use lining figures with small capitals.
# Change v0.4: Use old-style figures with small capitals again.
ttofamily="tt st it tc"
#ttofamily="tt st it"
#ttfamily="m/sc"

ssofamily="ss si sx so"

vtofamily="vt vi"

dhofamily="dh"


function getpl () {
curfam=$1

echo "# Converting .tfm to .pl" >> $logfile

for f in ${curfam}; do 
    for s in ${size}; do 
 	if [ -z `${kpsewhich} tfm ec${f}${s}.tfm` ] ; then 
 	   echo "Making ec${f}${s}.tfm" >> ${logfile}
	   echo -n "ec${f}${s}.tfm "
	   mktextfm ec${f}${s}
	fi
 	if [ `${kpsewhich} tfm ec${f}${s}.tfm` ] ; then 
 	   tftopl `${kpsewhich} tfm ec${f}${s}.tfm` ./ec${f}${s}.pl &>/dev/null;
 	   echo "ec${f}${s}.tfm -> ec${f}${s}.pl" >> ${logfile}
	   echo -n "ec${f}${s}.pl "
 	else
 	   echo "! tfm file ec${f}${s}.tfm not found." >> ${logfile} 
	   echo "! ec${f}${s}.tfm not found."
 	fi
 	if [ -z `${kpsewhich} tfm tc${f}${s}.tfm` ] ; then 
 	   echo "Making tc${f}${s}.tfm" >> ${logfile}
	   echo -n "tc${f}${s}.tfm "
	   mktextfm tc${f}${s}
	fi
 	if [ `${kpsewhich} tfm tc${f}${s}.tfm` ] ; then 
 	   tftopl `${kpsewhich} tfm tc${f}${s}.tfm` ./tc${f}${s}.pl &> /dev/null;
 	   echo "tc${f}${s}.tfm -> tc${f}${s}.pl" >> ${logfile}
	   echo -n "tc${f}${s}.pl "
 	else
 	   echo "! tfm file tc${f}${s}.tfm not found" >> ${logfile}
	   echo "! tc${f}${s}.tfm not found."
 	fi
    done
done

echo
}

function getvf () {
curfam=$1

echo "# Converting .vpl to .vf and .tfm" >> $logfile

for f in $curfam; do 
    for s in $size; do 
	if [ -f	hfo${f}${s}.vpl ]; then 
	   vptovf hfo${f}${s}.vpl hfo${f}${s}.vf hfo${f}${s}.tfm &> /dev/null; 
	   echo "hfo${f}${s}.vpl -> hfo${f}${s}.vf" >> ${logfile}
	   echo -n "hfo${f}${s}.vf "
	else
	   echo "vpl file hfo${f}${s}.vpl not found" >> ${logfile}
	   echo "! hfo${f}${s}.vpl not found."
	fi
    done
done

echo
}

function cleanup () {
curfam=$1

for f in $curfam; do 
    for s in $size; do 
	rm -f hfo${f}${s}.vpl ec${f}${s}.pl ec${f}${s}.mtx tc${f}${s}.pl tc${f}${s}.mtx
    done
done
}

function intro () {
cat << EOM
\input fontinst.sty

\declareencoding{TEX TEXT COMPANION SYMBOLS 1---TS1}{TS1}

\installfonts
EOM
}

function extro () {
cat << EOM
\endinstallfonts

\bye
EOM
}

function echomtx () {
f=$1

echo
for ec in ${size}; do
    if [ -f ec${f}${ec}.pl ]; then
	echo "\frompl{ec${f}${ec}}"
    fi
    if [ -f tc${f}${ec}.pl ]; then
	echo "\frompl{tc${f}${ec}}"
    fi
done;
}

# Inserts kerning information to the mtx file
function insertkerns ()
{
    f=$1
# Change v1.00: Scale Kerning by $FAK/1000
    FAK=$2

    for ec in ${size}
    do

	MULTI=`grep '\quad' ec${f}${ec}.mtx | sed s/'.*{\([0-9]*\)}'/'\1'/`
	echo ec${f}${ec}: multiplikator $MULTI

	GKERN="0110"
	GKERN=`echo "$GKERN $MULTI * 1000 / p" | dc`
	KKERN="0070"
	KKERN=`echo "$KKERN $MULTI * 1000 / p" | dc`

	LISTE="%"
	for CHAR in A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \
	    Adieresis Odieresis Udieresis
	do
	    RKERN=$GKERN
	    LKERN=$GKERN
	    case $CHAR in
		A) LKERN=`echo "$LKERN 1200 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1200 * 1000 / $FAK * 1000 / p" | dc`;;
		B) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		C) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 600 * 1000 / $FAK * 1000 / p" | dc`;;
		D) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		E) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		G) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 600 * 1000 / $FAK * 1000 / p" | dc`;;
		K) LKERN=`echo "$LKERN 1400 * 1000 / $FAK * 1000 / p" | dc`;;
		L) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		N) LKERN=`echo "$LKERN 1100 * 1000 / $FAK * 1000 / p" | dc`;;
		O) LKERN=`echo "$LKERN 600 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 600 * 1000 / $FAK * 1000 / p" | dc`;;
		P) LKERN=`echo "$LKERN 1100 * 1000 / $FAK * 1000 / p" | dc`;;
		Q) LKERN=`echo "$LKERN 600 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 600 * 1000 / $FAK * 1000 / p" | dc`;;
		R) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		S) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		T) LKERN=`echo "$LKERN 1200 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1200 * 1000 / $FAK * 1000 / p" | dc`;;
		V) LKERN=`echo "$LKERN 1300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1300 * 1000 / $FAK * 1000 / p" | dc`;;
		W) LKERN=`echo "$LKERN 1300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1300 * 1000 / $FAK * 1000 / p" | dc`;;
		X) LKERN=`echo "$LKERN 1300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1300 * 1000 / $FAK * 1000 / p" | dc`;;
		Y) LKERN=`echo "$LKERN 1300 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1300 * 1000 / $FAK * 1000 / p" | dc`;;
		Z) LKERN=`echo "$LKERN 300 * 1000 / $FAK * 1000 / p" | dc`;;
		Adieresis) LKERN=`echo "$LKERN 1200 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1200 * 1000 / $FAK * 1000 / p" | dc`;;
		Odieresis) LKERN=`echo "$LKERN 600 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 600 * 1000 / $FAK * 1000 / p" | dc`;;
	    esac
	    LISTE="$LISTE\\
\\\\setkern{guillemotright}{$CHAR}{-$RKERN}\\
\\\\setkern{$CHAR}{guillemotleft}{-$LKERN}"
	done

	for CHAR in a b c d e f g h i j k l m n o p q r s t u v w x y z \
	    adieresis odieresis udieresis germandbls
	do
	    RKERN=$KKERN
	    LKERN=$KKERN
	    case $CHAR in
		b) LKERN=`echo "$LKERN 1000 * 1000 / $FAK * 1000 / p" | dc`; \
		   RKERN=`echo "$RKERN 1200 * 1000 / $FAK * 1000 / p" | dc`;;
	    esac
	    LISTE="$LISTE\\
\\\\setkern{guillemotright}{$CHAR}{-$RKERN}\\
\\\\setkern{$CHAR}{guillemotleft}{-$LKERN}"
	done

	sed "1,/\\\\setrawglyph/ { /\\\\setrawglyph/i \\
$LISTE
; }" ec${f}${ec}.mtx > ec${f}${ec}.mtx.tmp && \
	mv -f ec${f}${ec}.mtx.tmp ec${f}${ec}.mtx || \
	rm -f ec${f}${ec}.mtx.tmp
    done
}

function echoinstalls () {
enc=$1; f=$2; se=$3; sh=$4

echo
for ec in ${size}; do
    case ${ec} in
	0500) fs="5";;
        0600) fs="6";;
	0700) fs="7";;
	0800) fs="8";;
	0900) fs="9";;
	1000) fs="10";;
	1095) fs="10.95";;
	1200) fs="12";;
	1440) fs="14.4";;
	1728) fs="17.28";;
	2074) fs="20.74";;
	2488) fs="24.88";;
	2986) fs="29.86";;
	3583) fs="35.83";;
    esac
    if [ -f ec${f}${ec}.pl -a -f tc${f}${ec}.pl ]; then
	echo "\installfont{hfo${f}${ec}}{ec${f}${ec},tc${f}${ec},dostretch}{T19}{T1}{hfo${enc}}{${se}}{${sh}}{<${fs}>}"
# Change v0.2: Use lining figures with small capitals again.
#              Thus, no extra handling for these fonts necessary anymore.
# Change v0.4: Use old-style figures with small capitals again.
    else if [ ${f} == "cc" -o ${f} == "xc" -o ${f} == "sc" -o ${f} == "oc" -o ${f} == "tc" ]
    then
	[ ${f} == "cc" ] && tcf="rm"
	[ ${f} == "xc" ] && tcf="bx"
	[ ${f} == "sc" ] && tcf="sl"
	[ ${f} == "oc" ] && tcf="bl"
	[ ${f} == "tc" ] && tcf="tt"
	if [ -f ec${f}${ec}.pl -a -f tc${tcf}${ec}.pl ]; then
	    echo "\installfont{hfo${f}${ec}}{ec${f}${ec},tc${tcf}${ec},dostretch}{T19}{T1}{hfo${enc}}{${se}}{${sh}}{<${fs}>}"
#	    echo "\installfont{hfo${f}${ec}}{ec${f}${ec},dostretch}{T1}{T1}{hfo${enc}}{${se}}{${sh}}{<${fs}>}"
	fi
    fi
 fi
done;
}


function modfd () 
{
    fdfile=$1

    cat ${fdfile} | \
	grep -1 -e '<[-.0-9]*>' \
		-e 'DeclareFontShape' | \
	grep -v -e '<10\.95>' -e '<14\.4>' -e '<20\.74>' \
		-e '<24\.88>' -e '<29\.86>' -e '<35\.83>' | \
	sed -e 's/<5>/<-6>/g' -e 's/<6>/<6-7>/g' -e 's/<7>/<7-8>/g' \
	    -e 's/<8>/<8-9>/g' -e 's/<9>/<9-10>/g' -e 's/<10>/<10-12>/g' \
	    -e 's/<12>/<12-17>/g' -e 's/<17\.28>/<17->/g' > asdf.fd
    echo '\else' >> asdf.fd
    echo '\typeout{'${fdfile}': Using all design sizes}%' >> asdf.fd
    sed '/\\endinput/d' asdf.fd > tmp.fd && mv -f tmp.fd asdf.fd
    cat ${fdfile} | \
	sed -e '/DeclareFontFamily/i \
\\ifhfofixcm\
\\typeout{'${fdfile}': Using fewer design sizes (fix-cm)}% \
' \
	    -e '/\\endinput/i \
\\fi\
' \
	    -e '/\\DeclareFontFamily/r asdf.fd' > tmp.fd
    mv -f tmp.fd ${fdfile}
    rm -f asdf.fd
}


# function main () {

# Roman family
#

echo >> $logfile
echo "Roman Family" >> $logfile
echo "------------" >> $logfile
echo >> $logfile

getpl "$rofamily"

(
intro

echomtx rm
echomtx ti
echomtx sl
echomtx ui
echomtx cc
echomtx sc
echomtx rb
echomtx bx
echomtx bi
echomtx bl
echomtx xc
echomtx oc

extro
) > hformtx.tex

tex hformtx.tex

insertkerns rm 1000
insertkerns ti 1000
insertkerns sl 1000
insertkerns ui 1000
insertkerns cc 1000
insertkerns sc 1000
insertkerns rb 1000
insertkerns bx 1000
insertkerns bi 1000
insertkerns bl 1000
insertkerns xc 1000
insertkerns oc 1000

(
intro

echo; echo "\installfamily{T1}{hfor}{}"

echoinstalls r rm m n
echoinstalls r ti m it
echoinstalls r sl m sl
echoinstalls r ui m ui
echoinstalls r cc m sc
echoinstalls r sc m scsl
echoinstalls r rb b n
echoinstalls r bx bx n
echoinstalls r bi bx it
echoinstalls r bl bx sl
echoinstalls r xc bx sc
echoinstalls r oc bx scsl

extro
) > hfor.tex

tex hfor.tex

# Change v0.2: LaTeX is big enough not to split generation of Roman family.

getvf "$rofamily"

cleanup "$rofamily"

ed t1hfor.fd <<EOS
\$-1,\$d
w
q
EOS

(
# Change v0.2: Support slanted small capitals
# Change v0.90: Fix the wrong generation of this entry. It prevented LaTeX
#              from finding the correct small caps with old-style digits.
for f in m bx; do
    echo "\DeclareFontShape{T1}{hfor}{$f}{scit}{<->ssub * hfor/$f/scsl}{}"
done
echo
# Change v0.2: Use lining figures with small capitals again.
# Change v0.4: Use old-style figures with small capitals again.
for f in $rfamily; do
	se=`echo $f | cut -f 1 -d "/"`
	sh=`echo $f | cut -f 2 -d "/"`
	echo "\DeclareFontShape{T1}{hfor}{$se}{$sh}{<->ssub * cmr/$se/$sh}{}"
done
echo
echo '\endinput'
) >> t1hfor.fd

modfd t1hfor.fd

sed 's/Fontinst .*/ v'$VERSION'  European Computer Modern with oldstyle digits]/' \
    t1hfor.fd > asdf && mv -f asdf t1hfor.fd

# Sans Serif family

echo >> $logfile
echo "Sans Serif family" >> $logfile
echo "-----------------" >> $logfile
echo >> $logfile

getpl "$ssofamily"

(
intro

echomtx ss
echomtx si
echomtx sx
echomtx so

extro
) > hfossmtx.tex

tex hfossmtx.tex

# Change v1.00: Add kerning to sans-serif fonts, 70% of serif fonts.
insertkerns ss 0700
insertkerns si 0700
insertkerns sx 0700
insertkerns so 0700

(
intro

echo; echo "\installfamily{T1}{hfoss}{}"

echoinstalls ss ss m n
echoinstalls ss si m sl
echoinstalls ss sx bx n
echoinstalls ss so bx sl

extro
) > hfoss.tex

tex hfoss.tex

getvf "$ssofamily"

cleanup "$ssofamily"

ed t1hfoss.fd <<EOS
\$-1,\$d
w
q
EOS

for f in $ssfamily; do
	se=`echo $f | cut -f 1 -d "/"`
	sh=`echo $f | cut -f 2 -d "/"`
	echo "\DeclareFontShape{T1}{hfoss}{$se}{$sh}{<->ssub * cmss/$se/$sh}{}" >> t1hfoss.fd
done

for f in m bx; do
	echo "\DeclareFontShape{T1}{hfoss}{$f}{it}{<->ssub * hfoss/$f/sl}{}" >> t1hfoss.fd
	echo "\DeclareFontShape{T1}{hfoss}{$f}{scit}{<->ssub * hfoss/$f/sl}{}" >> t1hfoss.fd
	echo "\DeclareFontShape{T1}{hfoss}{$f}{scsl}{<->ssub * hfoss/$f/sl}{}" >> t1hfoss.fd
done
echo '' >> t1hfoss.fd
echo '\endinput' >> t1hfoss.fd

modfd t1hfoss.fd

sed 's/Fontinst .*/ v'$VERSION'  European Computer Modern with oldstyle digits]/' \
    t1hfoss.fd > asdf && mv -f asdf t1hfoss.fd


# Typewriter family

echo >> $logfile
echo "Typewriter family" >> $logfile
echo "-----------------" >> $logfile
echo >> $logfile

getpl "$ttofamily"

(
intro

echomtx tt
echomtx it
echomtx st
# Change v0.2: Use lining figures with small capitals.
# Change v0.4: Use old-style figures with small capitals again.
echomtx tc

extro
) > hfottmtx.tex

tex hfottmtx.tex

(
intro

echo; echo "\installfamily{T1}{hfott}{\hyphenchar\font=\m@ne }"

echoinstalls tt tt m n
echoinstalls tt it m it
echoinstalls tt st m sl
# Change v0.2: Use lining figures with small capitals.
# Change v0.4: Use old-style figures with small capitals again.
echoinstalls tt tc m sc

extro
) > hfott.tex

tex hfott.tex

getvf "$ttofamily"

cleanup "$ttofamily"

ed t1hfott.fd <<EOS
,s/\\\hyphenchar \\\font =\\\m @ne /\\\hyphenchar\\\font=\\\m@ne/
w
q
EOS

(
echo
# Change v0.2: Use lining figures with small capitals.
# Change v0.4: Use old-style figures with small capitals again.
for f in $ttfamily; do
	se=`echo $f | cut -f 1 -d "/"`
	sh=`echo $f | cut -f 2 -d "/"`
	echo "\DeclareFontShape{T1}{hfott}{$se}{$sh}{<->ssub * cmtt/$se/$sh}{}"
done
echo
echo '\endinput'
) >> t1hfott.fd

modfd t1hfott.fd

sed 's/Fontinst .*/ v'$VERSION'  European Computer Modern with oldstyle digits]/' \
    t1hfott.fd > asdf && mv -f asdf t1hfott.fd


# Dunhill family

echo >> $logfile
echo "Dunhill family" >> $logfile
echo "--------------" >> $logfile
echo >> $logfile

getpl "$dhofamily"

(
intro

echomtx dh

extro

) > hfodhmtx.tex

tex hfodhmtx.tex

(
intro

echo; echo "\installfamily{T1}{hfodh}{}"

echoinstalls dh dh m n

extro

) > hfodh.tex

tex hfodh.tex

getvf "$dhofamily"

cleanup "$dhofamily"

modfd t1hfodh.fd

sed 's/Fontinst .*/ v'$VERSION'  European Computer Modern with oldstyle digits]/' \
    t1hfodh.fd > asdf && mv -f asdf t1hfodh.fd


# Variable width Typewriter family

echo >> $logfile
echo "Variable width Typewriter family" >> $logfile
echo "--------------------------------" >> $logfile
echo >> $logfile

getpl "$vtofamily"

(
intro

echomtx vt
echomtx vi

extro
) > hfovtmtx.tex

tex hfovtmtx.tex

(
intro

echo; echo "\installfamily{T1}{hfovt}{\hyphenchar\font=\m@ne }"

echoinstalls vt vt m n
echoinstalls vt vi m it

extro
) > hfovt.tex

tex hfovt.tex

getvf "$vtofamily"

cleanup "$vtofamily"

ed t1hfovt.fd <<EOS
,s/\\\hyphenchar \\\font =\\\m @ne /\\\hyphenchar\\\font=\\\m@ne/
w
q
EOS

echo '\endinput' >> t1hfovt.fd

modfd t1hfovt.fd

sed 's/Fontinst .*/ v'$VERSION'  European Computer Modern with oldstyle digits]/' \
    t1hfovt.fd > asdf && mv -f asdf t1hfovt.fd


exit 0

# }
