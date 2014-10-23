#!/bin/sh

set -e
set -x

log() {
  echo $* >> /dev/stderr
}

clone() {
  ( cd $SNAP_CACHE_DIR/r-snap-texlive && git pull )
}

clone_or_pull() {
  if ! clone; then
    rm -rf $SNAP_CACHE_DIR/r-snap-texlive
    git clone https://github.com/krlmlr/r-snap-texlive.git $SNAP_CACHE_DIR/r-snap-texlive
  fi
}

set_symlinks() {
  sudo ln -s -f $SNAP_CACHE_DIR/r-snap-texlive/texlive/bin/x86_64-linux/* /usr/local/bin
}

clone_or_pull
set_symlinks
