#!/bin/sh
echo "make clean ..."
make clean
echo "configure ..."
./configure \
--prefix=./win32/release \
--target-os=win32 \
--enable-gpl \
--enable-small \
--enable-shared \
--enable-cross-compile \
--toolchain=msvc \
--disable-postproc \
--disable-doc \
--disable-ffplay \
--disable-ffprobe \
--disable-avdevice \
--disable-symver

# echo "makeing ..."
# make -j6 #改成你的CPU核心数，6表示编译时占用6核
# make install