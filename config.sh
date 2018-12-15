#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
Mod=Gio
MOD=`echo "${Mod}" | tr '[:lower:]' '[:upper:]'`
Module=${Mod}-2.0
MODULE=`echo "${Module}" | tr '[:lower:]' '[:upper:]'`
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
BUILD_DIR=`pwd`/.build
export PATH="${BUILD_DIR}/gir2swift/.build/release:${BUILD_DIR}/gir2swift/.build/debug:${PATH}"
export LINKFLAGS=`pkg-config --libs $module gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//' | tr '\n' ' ' | sed -e 's/-Xcc[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//'`
export CCFLAGS=`pkg-config --cflags $module gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed -e 's/^/-Xcc /' | tr '\n' ' ' | sed -e 's/-Xcc[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//'`
TAC="tail -r"
if which tac >/dev/null ; then
   TAC=tac
   else if which gtac >/dev/null ; then
	TAC=gtac
   fi
fi
