#!/bin/bash -ex

# sudo apt-get install -qq automake libtool make python zlib1g-dev

git clone https://github.com/file/file
cd file
autoreconf -f -i
./configure --disable-silent-rules
make -j4
make -C tests check
cp magic/magic.mgc ../
