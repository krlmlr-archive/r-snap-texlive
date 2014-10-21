#!/bin/sh

set -e

CACHE_BASE_PATH=$SNAP_CACHE_DIR/r-snap-texlive
CACHE_VERSION_FILENAME=r-snap-texlive-cache-version
CACHE_VERSION_PATH=$CACHE_BASE_PATH/$CACHE_VERSION_FILENAME
CURRENT_VERSION=1

log() {
  echo $* >> /dev/stderr
}

check_cache_version() {
  CACHE_VERSION=$(cat $CACHE_VERSION_PATH 2> /dev/null || echo 0)
  log "Cache version: $CACHE_VERSION"
  log "Current version: $CURRENT_VERSION"
  if test $CACHE_VERSION -lt $CURRENT_VERSION; then
    log "Clearing cache"
    rm -rf $CACHE_BASE_PATH
  fi
  mkdir -p $CACHE_BASE_PATH
  update_cache_version
}

update_cache_version() {
  echo $CURRENT_VERSION > $CACHE_VERSION_PATH
}

provide_latex() {
  if ! test -d texlive; then
    if ! install_latex; then
      rm -rf $CACHE_BASE_PATH/texlive
      return 1
    fi
  fi
}

install_latex() {
  mkdir $CACHE_BASE_PATH/texlive
  pushd /tmp
  curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xzv
  cd install-tl-*
  ./install-tl --profile=$SNAP_WORKING_DIR/texlive.profile
  popd
}

push_latex() {
  rm -rf texlive
  cp -arx $CACHE_BASE_PATH/texlive .
  git add -A
  if test -n $(git status --porcelain); then
    git commit -m "update bits"
    git push origin
  fi
}

check_cache_version
provide_latex
push_latex
