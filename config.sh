#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
Mod=Gio
Module=${Mod}-2.0
MODULE=`echo "${Module}" | tr '[:lower:]' '[:upper:]'`
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
BUILD_DIR=`pwd`/.build
export PATH="${BUILD_DIR}/gir2swift/.build/release:${BUILD_DIR}/gir2swift/.build/debug:${PATH}"
LINKFLAGS=`pkg-config --libs $module gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//' | tr '\n' ' '`
CCFLAGS=`pkg-config --cflags $module  gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' `
TAC="tail -r"
if which tac >/dev/null ; then
   TAC=tac
   else if which gtac >/dev/null ; then
	TAC=gtac
   fi
fi
