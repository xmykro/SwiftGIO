#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
VER=2.0
JAZZY_VER=2.62.1
Mod=Gio
MOD=`echo "${Mod}" | tr '[:lower:]' '[:upper:]'`
Module=${Mod}-$VER
MODULE=`echo "${Module}" | tr '[:lower:]' '[:upper:]'`
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
BUILD_DIR=`pwd`/.build
export PATH="${BUILD_DIR}/gir2swift/.build/release:${BUILD_DIR}/gir2swift/.build/debug:${PATH}:/usr/local/opt/ruby/bin:`echo /usr/local/lib/ruby/gems/*/bin | tr ' ' '\n' | tail -n1`:${PATH}:`echo /var/lib/gems/*/gems/jazzy-*/bin/ | tr ' ' '\n' | tail -n1`:/usr/local/bin"
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig:${PKG_CONFIG_PATH}
export LINKFLAGS="`pkg-config --libs $module gio-unix-2.0 glib-2.0 | tr ' ' '\n' | tr '	' '\n' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//' | tr '\n' ' ' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//' | sed -e 's/-pthread/-lpthread/g' -e 's/^/-Xlinker /' -e 's/-Wl,//g' -e 's/ -pthread/ -lpthread/g' -e 's/-Xcc *-Xlinker/-Xlinker/g' -e 's/-Xlinker *-Xcc/-Xcc/g' -e 's/-Xlinker *--export-dynamic//g' -e 's/-Xcc *-Xcc/-Xcc/g' -e 's/-Xlinker *-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *-Xlinker/-Xlinker/g' -e 's/-Xlinker *$//'`"
export CCFLAGS="`pkg-config --cflags $module gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed -e 's/^/-Xcc /' | tr '\n' ' ' | tr '	' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//g' -e 's/ -pthread/ /g' -e 's/-Xcc *-Xlinker/-Xlinker/g' -e 's/-Xlinker *-Xcc/-Xcc/g' -e 's/-Xlinker *--export-dynamic//g' -e 's/-Xcc *-Xcc/-Xcc/g' -e 's/-Xlinker *-Xlinker/-Xlinker/g' -e 's/-Xcc *-Xcc/-Xcc/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//' -e 's/-Xcc *$//'`"
TAC="tail -r"
if which tac >/dev/null ; then
   TAC=tac
   else if which gtac >/dev/null ; then
	TAC=gtac
   fi
fi
JAZZY_B=`echo $CCFLAGS $LINKFLAGS | sed 's/  */,/g'`
