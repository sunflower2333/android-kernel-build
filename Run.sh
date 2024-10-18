#!/bin/bash
# Download repo

cd android-kernel

echo "Downloding repo"
curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o repo
chmod +x repo

echo "Init repo"
./repo init -u https://android.googlesource.com/kernel/manifest -b common-android12-5.10-2023-11 --depth=1
mv a.xml .repo/manifests/default.xml

echo "sync data"
./repo sync

echo "overlay config"
echo cp gki_config common/arch/arm64/configs/gki_defconfig

# Try build
echo "Building...."
mkdir -p ./gki202311-out/11136126
SKIP_MRPROPER=1 LTO=thin DIST_DIR=./gki202311-out/11136126 BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh -j16
