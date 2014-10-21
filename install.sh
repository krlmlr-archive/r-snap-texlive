#!/bin/sh

set -e

log() {
  echo $* >> /dev/stderr
}

clone_or_pull() {
  cd $SNAP_CACHE_DIR
  if test -d r-snap-texlive/.git; then
    cd r-snap-texlive
    git pull
  else
    git clone https://github.com/krlmlr/r-snap-texlive.git
  fi
}

set_symlinks() {
  sudo ln -s -f $SNAP_CACHE_DIR/r-snap-texlive/texlive/bin/x86_64-linux/* /usr/local/bin
}

clone_or_pull
set_symlinks
