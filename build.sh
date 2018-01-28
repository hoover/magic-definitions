#!/bin/bash -ex

# sudo apt-get install -qq automake libtool make python zlib1g-dev

git clone https://github.com/file/file
cd file

curl 'http://git.pld-linux.org/gitweb.cgi?p=packages/file.git;a=blob_plain;f=name-use-count.patch;h=ef8561eee670839a2f8caca35ec7f3d04df91179;hb=HEAD' | patch -p1

autoreconf -f -i
./configure --disable-silent-rules --prefix="`pwd`"
make -j4
make -C tests check
make install
cp magic/magic.mgc ../
