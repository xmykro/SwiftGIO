#!/bin/sh
#
# Remove Packages directory and generated files
#
. ./config.sh
./clean.sh
exec rm -rf Package.resolved Package.pins Packages .docs.old Sources/${MOD}/*-*.swift Sources/${MOD}/${Module}.swift Sources/${MOD}/Swift${Mod}.swift ${Mod}.xcodeproj
