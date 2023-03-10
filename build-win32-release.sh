#!/bin/sh
echo "make clean ..."
make clean
echo "configure ..."
./configure \
--prefix=./output-win32-release \
--enable-gpl \
--enable-small \
--enable-shared \
--enable-cross-compile \
--enable-x86asm \
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