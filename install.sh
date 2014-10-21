#!/bin/sh

set -e

clone_or_pull() {
  cd $SNAP_CACHE_DIR
  if test -d r-snap-texlive/.git; then
    cd r-snap-texlive
    git pull
  else
    git clone git@github.com:krlmlr/r-snap-texlive.git
  fi
}

(clone_or_pull > /dev/null)
echo 'PATH='$SNAP_CACHE_DIR'/r-snap-texlive/texlive/bin/x86_64-linux:$PATH'