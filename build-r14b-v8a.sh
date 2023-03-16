#!/bin/bash
NDK=$(pwd)/android-ndk-r14b
PLATFORM=$NDK/platforms/android-21/arch-arm64
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
ARCH=arm64
CPU=armv8-a
PREFIX=./android/$CPU
CFLAG="-I$PLATFORM/usr/include -fPIC -DANDROID -march=$CPU -Os"
LDFLAGS="-L$PLATFORM/usr/lib"

# 注意上次构建结果的o文件对当前链接的坑
# libavutil/../compat/strtod.o: error adding symbols: File in wrong format
# find . -name '*.o' -type f -print -exec rm -rf {} \;
# find . -name "*.o" -type f -delete
rm -rf $PREFIX
rm -rf ./compat/strtod.o
#输出路径
function buildFF
{
    ./configure \
    --cpu=$CPU  \
    --prefix=$PREFIX \
    --target-os=android \
    --cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
    --arch=$ARCH \
    --sysroot=$PLATFORM \
    --extra-cflags="$CFLAG" \
    --extra-ldflags="$LDFLAGS" \
    --cc=$TOOLCHAIN/bin/aarch64-linux-android-gcc \
    --nm=$TOOLCHAIN/bin/aarch64-linux-android-nm \
    --enable-shared \
    --enable-runtime-cpudetect \
    --enable-gpl \
    --enable-small \
    --enable-cross-compile \
    --disable-static \
    --disable-debug \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-postproc \
    --disable-avdevice \
    --disable-symver \
    --disable-stripping \

    make -j16
    make install
    echo "编译结束！"
} 
make clean
buildFF