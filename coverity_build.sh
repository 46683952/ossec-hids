#!/bin/sh

# This script runs all compilations for a coverity build

set -e

if [ "${COVERITY}" != "yes" ]; then exit 1; fi #early exit for all travis matrixx builds, execpt one

cd src/

make clean
make TARGET=server USE_ZEROMQ=yes USE_GEOIP=yes USE_PRELUDE=yes USE_OPENSSL=auto USE_INOTIFY=yes V=1 build -j

make clean
make TARGET=agent USE_OPENSSL=auto V=1 build -j

make clean
make TARGET=winagent V=1 build -j
