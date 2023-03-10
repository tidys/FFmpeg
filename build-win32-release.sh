#!/bin/sh
./configure \
--prefix=./win32/release \
--toolchain=msvc \
--target-os=win32 \
--arch=x86 \
--enable-gpl \
--enable-small \
--enable-shared \
--enable-cross-compile \
--disable-postproc \
--disable-doc \
--disable-logging \
--disable-programs \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-avdevice \
--extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
--extra-ldflags="-APPCONTAINER WindowsApp.lib" \
--disable-symver
make clean
make install