#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
Mod=Gio
Module=${Mod}-2.0
MODULE=`echo "${Module}" | tr '[:lower:]' '[:upper:]'`
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
LINKFLAGS=`pkg-config --libs $module gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xlinker /' | tr '\n' ' '`
CCFLAGS=`pkg-config --cflags $module  gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' `
