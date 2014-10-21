#!/bin/sh
# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.

mydir=`cd \`dirname $0\` && pwd`

if test "x$1" = x-l || whoami | grep karl >/dev/null; then
  # i always forget
  local=true
else
  local=false
fi

rm -rf /tmp/gentium??????
tmpdir=`mktemp -d /tmp/gentiumXXXXXX`
cd "$tmpdir" || exit 1

if $local; then
  TDS=`cd $mydir/../../.. && pwd`
else
  TDS="$tmpdir/TDS"
  svn co "http://svn.contextgarden.net/gentium/gentium/" "$TDS"
fi

pkgname=gentium-tug
(cd $TDS/doc/fonts/$pkgname && make clean)

CTAN="$tmpdir/$pkgname"
mkdir -p "$CTAN/map" || exit 1

rsync="rsync -a --delete --exclude=**/.svn"
$rsync "$TDS/doc/fonts/$pkgname/"             "$CTAN/doc/" || exit 1
$rsync "$TDS/source/fonts/$pkgname/"          "$CTAN/source/"
$rsync "$TDS/tex/context/third/$pkgname/"     "$CTAN/context/"
$rsync "$TDS/tex/latex/$pkgname/"             "$CTAN/latex/"
$rsync "$TDS/fonts/afm/public/$pkgname/"      "$CTAN/afm/"
$rsync "$TDS/fonts/tfm/public/$pkgname/"      "$CTAN/tfm/"
$rsync "$TDS/fonts/truetype/public/$pkgname/" "$CTAN/truetype/"
$rsync "$TDS/fonts/type1/public/$pkgname/"    "$CTAN/type1/"
$rsync "$TDS/fonts/enc/dvips/$pkgname/"       "$CTAN/enc/"
$rsync "$TDS/fonts/map/dvips/$pkgname/"       "$CTAN/map/dvips/"
$rsync "$TDS/fonts/map/pdftex/$pkgname/"      "$CTAN/map/pdftex/"

printf "\f making .tds.zip:\n"
tdszip_dest=$tmpdir
(cd $TDS \
 && zip -qr $tdszip_dest/$pkgname.tds.zip [a-z]* -x \*.svn\*) # not README

printf "\f making combined zip for upload:\n"
ln -s doc/README $CTAN/README
(cd $tmpdir && zip -qry $tmpdir/$pkgname.zip *) # -y: keep README as symlink

# create a single .zip for upload that contains
#   a) $pkgname.tds.zip
#   b) $pkgname/ subdir for browsing
# because that's what CTAN wants these days.

if $local; then :; else
  echo
  echo "Please make sure that you have set"
  echo "    use-commit-times = yes"
  echo "in ~/.subversion/config"
  echo
fi

ls -l $tdszip_dest/$pkgname.tds.zip $tmpdir/$pkgname.zip
