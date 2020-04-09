#!/bin/bash
source halium.env
cd $ANDROID_ROOT

# Halium 9 specific
./hybris-patches/apply-patches.sh

# Clean up disk space
df -h
rm -rf .repo
df -h

source build/envsetup.sh
export USE_CCACHE=1
breakfast $DEVICE
make -j$(nproc) halium-boot
#make -j$(nproc) systemimage

echo "md5sum halium-boot.img"
md5sum $ANDROID_ROOT/out/target/product/${DEVICE}/halium-boot.img
#md5sum $ANDROID_ROOT/out/target/product/${DEVICE}/system.img
