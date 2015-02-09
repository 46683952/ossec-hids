#!/bin/sh

# This script sets up the environment for a coverity build

set -e

if [ "${COVERITY}" != "yes" ]; then exit 1; fi #early exit for all travis matrixx builds, execpt one

sudo apt-get update -qq
sudo apt-get install geoip-bin geoip-database libgeoip-dev libgeoip1 libprelude-dev libzmq3-dev aptitude

wget http://download.zeromq.org/czmq-2.2.0.tar.gz
tar xfz czmq-2.2.0.tar.gz
cd czmq-2.2.0/
./configure
make all -j
sudo make install

sudo aptitude -y install mingw-w64 nsis

cd ../
