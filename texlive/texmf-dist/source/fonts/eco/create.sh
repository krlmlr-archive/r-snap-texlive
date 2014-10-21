#!/bin/sh
#
#eco v1.3: A package for using oldstyle numerals with the ec fonts
#
#For use with ec fonts (European Computer Modern fonts by J"org Knappen
#<knappen@vkpmzd.kph.uni-mainz.de>, CTAN:/fonts/ec)
#
#Copyright (C) 1996--1999 Sebastian Marius Kirsch <skirsch@t-online.de>
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
# - TeX, fontinst >= 1.335
# - a shell which supports here-documents (ie. bash)
# - a TeX with kpathsea (ie. teTeX) 
#

size="0500 0600 0700 0800 0900 1000 1095 1200 1440 1728 2074 2488 2986 3583"
family="rm ti ui sl rb bx bl bi ss si sx so tt st it vt vi dh"

kpsewhich=/usr/bin/kpsewhich

logfile=./eco_fonts.log

rofamily="rm ti ui sl rb bx bl bi"
rfamily="m/sc bx/sc"
# which indentifiers give to this one? sc=m/slc, oc=bx/slc?

ttofamily="tt st it"
ttfamily="m/sc"

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
	if [ -f	eco${f}${s}.vpl ]; then 
	   vptovf eco${f}${s}.vpl ../vf/eco${f}${s}.vf ../tfm/eco${f}${s}.tfm &> /dev/null; 
	   echo "eco${f}${s}.vpl -> eco${f}${s}.vf" >> ${logfile}
	   echo -n "eco${f}${s}.vf "
	else
	   echo "vpl file eco${f}${s}.vpl not found" >> ${logfile}
	   echo "! eco${f}${s}.vpl not found."
	fi
    done
done

echo
}

function cleanup () {
curfam=$1

for f in $curfam; do 
    for s in $size; do 
	rm -f eco${f}${s}.vpl ec${f}${s}.pl ec${f}${s}.mtx tc${f}${s}.pl tc${f}${s}.mtx
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
	echo "\installfont{eco${f}${ec}}{ec${f}${ec},tc${f}${ec},dostretch}{T19}{T1}{cmo${enc}}{${se}}{${sh}}{<${fs}>}"
    fi
done;
}


[ -d ../vf ] || mkdir ../vf
[ -d ../fd ] || mkdir ../fd
[ -d ../tfm ] || mkdir ../tfm

# Roman family
#
# I had to split up the roman family into two TeX-files because my TeX
# isn't big enough for this. That's also why I have to save T1cmor.fd after
# the first run and paste it together after the second. :-(

echo >> $logfile
echo "Roman Family" >> $logfile
echo "------------" >> $logfile
echo >> $logfile

getpl "$rofamily"

(
intro

echo; echo "\installfamily{T1}{cmor}{\hyphenchar\font='177 }"

echoinstalls r rm m n
echoinstalls r rb b n
echoinstalls r bx bx n
echoinstalls r bl bx sl

extro
) > ecor.tex

tex ecor.tex

mv T1cmor.fd _T1cmor.fd

(
intro

echo; echo "\installfamily{T1}{cmor}{\hyphenchar\font='177 }"

echoinstalls r sl m sl
echoinstalls r ti m it
echoinstalls r bi bx it
echoinstalls r ui m ui

extro
) > ecori.tex

tex ecori.tex

getvf "$rofamily"

cleanup "$rofamily"

ed _T1cmor.fd <<EOS
\$-1,\$d
w
q
EOS

ed T1cmor.fd <<EOS
1,10d
\$-1,\$d
1r _T1cmor.fd
w
q
EOS

for f in $rfamily; do
	se=`echo $f | cut -f 1 -d "/"`
	sh=`echo $f | cut -f 2 -d "/"`
	echo "\DeclareFontShape{T1}{cmor}{$se}{$sh}{<->ssub * cmr/$se/$sh}{}" >> T1cmor.fd
done

echo '\endinput' >> T1cmor.fd

mv T1cmor.fd ../fd

rm _T1cmor.fd

# Sans Serif family

echo >> $logfile
echo "Sans Serif family" >> $logfile
echo "-----------------" >> $logfile
echo >> $logfile

getpl "$ssofamily"

(
intro

echo; echo "\installfamily{T1}{cmoss}{\hyphenchar\font='177 }"

echoinstalls ss ss m n
echoinstalls ss si m sl
echoinstalls ss sx bx n
echoinstalls ss so bx sl

extro
) > ecoss.tex

tex ecoss.tex

getvf "$ssofamily"

cleanup "$ssofamily"

ed T1cmoss.fd <<EOS
\$-1,\$d
w
q
EOS

for f in $ssfamily; do
	se=`echo $f | cut -f 1 -d "/"`
	sh=`echo $f | cut -f 2 -d "/"`
	echo "\DeclareFontShape{T1}{cmoss}{$se}{$sh}{<->ssub * cmss/$se/$sh}{}" >> T1cmoss.fd
done

for f in m bx; do
	echo "\DeclareFontShape{T1}{cmoss}{$f}{it}{<->ssub * cmoss/$f/sl}{}" >> T1cmoss.fd
done

echo '\endinput' >> T1cmoss.fd

mv T1cmoss.fd ../fd

# Typewriter family

echo >> $logfile
echo "Typewriter family" >> $logfile
echo "-----------------" >> $logfile
echo >> $logfile

getpl "$ttofamily"

(
intro

echo; echo "\installfamily{T1}{cmott}{\hyphenchar\font=\m@ne }"

echoinstalls tt tt m n
echoinstalls tt it m it
echoinstalls tt st m sl

extro
) > ecott.tex

tex ecott.tex

getvf "$ttofamily"

cleanup "$ttofamily"

ed T1cmott.fd <<EOS
,s/\\\hyphenchar \\\font =\\\m @ne /\\\hyphenchar\\\font=\\\m@ne/
w
q
EOS

mv T1cmott.fd ../fd

# Dunhill family

echo >> $logfile
echo "Dunhill family" >> $logfile
echo "--------------" >> $logfile
echo >> $logfile

getpl "$dhofamily"

(
intro

echo; echo "\installfamily{T1}{cmodh}{\hyphenchar\font='177 }"

echoinstalls dh dh m n

extro

) > ecodh.tex

tex ecodh.tex

getvf "$dhofamily"

cleanup "$dhofamily"

mv T1cmodh.fd ../fd

# Variable width Typewriter family

echo >> $logfile
echo "Variable width Typewriter family" >> $logfile
echo "--------------------------------" >> $logfile
echo >> $logfile

getpl "$vtofamily"

(
intro

echo; echo "\installfamily{T1}{cmovt}{\hyphenchar\font=\m@ne }"

echoinstalls vt vt m n
echoinstalls vt vi m it

extro
) > ecovt.tex

tex ecovt.tex

getvf "$vtofamily"

cleanup "$vtofamily"

ed T1cmovt.fd <<EOS
,s/\\\hyphenchar \\\font =\\\m @ne /\\\hyphenchar\\\font=\\\m@ne/
w
q
EOS

mv T1cmovt.fd ../fd

exit 0
