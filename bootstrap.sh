#!/bin/sh

set -e

CACHE_BASE_PATH=$SNAP_CACHE_DIR/r-snap
CACHE_VERSION_FILENAME=r-snap-cache-version
CACHE_VERSION_PATH=$CACHE_BASE_PATH/$CACHE_VERSION_FILENAME
CURRENT_VERSION=2

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
      rm -rf texlive
      return 1
    fi
  fi
}

install_latex() {
  mkdir texlive
  pushd /tmp
  curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xzv
  cd install-tl-*
  ./install-tl --profile=$SNAP_WORKING_DIR/texlive.profile
  popd
}

provide_r() {
  if test -d r-devel; then
    recompile_r
  else
    git clone https://github.com/wch/r-source.git r-devel
    recompile_r
  fi
}

recompile_r() {
  cd r-devel
  git pull

  sudo yum install -y gcc-gfortran.x86_64
  export PATH=$CACHE_BASE_PATH/texlive/bin/x86_64-linux:$PATH

  tools/rsync-recommended
  R_PAPERSIZE=letter \
    R_BATCHSAVE="--no-save --no-restore" \
    R_BROWSER=xdg-open \
    PAGER=/usr/bin/pager \
    PERL=/usr/bin/perl \
    R_UNZIPCMD=/usr/bin/unzip \
    R_ZIPCMD=/usr/bin/zip \
    R_PRINTCMD=/usr/bin/lpr \
    LIBnn=lib \
    AWK=/usr/bin/awk \
    CFLAGS="-pipe -std=gnu99 -Wall -pedantic -O3" \
    CXXFLAGS="-pipe -Wall -pedantic -O3" \
    ./configure --enable-R-shlib \
                --without-blas \
                --without-lapack \
                --without-readline

  (cd doc/manual && make front-matter html-non-svn)

  echo -n 'Revision: ' > SVN-REVISION
  git log --format=%B -n 1 \
    | grep "^git-svn-id"    \
    | sed -E 's/^git-svn-id: https:\/\/svn.r-project.org\/R\/[^@]*@([0-9]+).*$/\1/' \
    >> SVN-REVISION
  echo -n 'Last Changed Date: ' >>  SVN-REVISION
  git log -1 --pretty=format:"%ad" --date=iso | cut -d' ' -f1 >> SVN-REVISION

  make
}

check_cache_version
cd $CACHE_BASE_PATH

provide_latex
provide_r
