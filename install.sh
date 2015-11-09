#!/bin/bash

ECLIPSE_RELEASE=mars
ECLIPSE_POINT=1
ECLIPSE_MD5="4256d9dc2629f81423846e5a63ba9cec"

ECLIM_RELEASE=2.5.0
ECLIM_MD5="6c30d38304c3d34c528e12c52c27c43a"

GET='wget -O'
which curl >/dev/null && GET='curl -C - -fLo'

EXT=tar.gz
EXTRACT='tar xf'
case "$(uname)" in
  Linux)
    OS=linux-gtk
    ;;
  Darwin)
    OS=macosx-cocoa
    ;;
  *)
    OS=win32
    EXT=zip
    EXTRACT=unzip
    ;;
esac
[ "$(uname -m)" = x86_64 ] && OS=${OS}-x86_64

ECLIPSE=eclipse.${EXT}
ECLIPSE_DIR=eclipse

ECLIM=eclim.jar

download_eclipse() {
  md5sum -c <(echo "$ECLIPSE_MD5"  "$ECLIPSE") && return
  $GET "$ECLIPSE" "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${ECLIPSE_RELEASE}/${ECLIPSE_POINT}/eclipse-java-${ECLIPSE_RELEASE}-${ECLIPSE_POINT}-${OS}.${EXT}&r=1"
}

install_eclipse() {
  [ -d "$ECLIPSE_DIR" ] && return
  download_eclipse || return 1
  $EXTRACT "$ECLIPSE"
}

download_eclim() {
  md5sum -c <(echo "$ECLIM_MD5"  "$ECLIM") && return
  $GET "$ECLIM" "http://downloads.sourceforge.net/project/eclim/eclim/${ECLIM_RELEASE}/eclim_${ECLIM_RELEASE}.jar"
}

install_eclim() {
  install_eclipse && download_eclim || return 2
  java -Dvim.files="$(pwd)" -Declipse.home="${ECLIPSE_DIR}" -jar "${ECLIM}" install
}

install_eclim || return 3
