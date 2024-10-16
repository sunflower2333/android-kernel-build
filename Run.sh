#!/bin/bash
# Download repo

cd android-kernel

curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o repo
chmod +x repo

./repo init -u https://android.googlesource.com/kernel/manifest -b common-android12-5.10-2023-11
mv a.xml .repo/manifests/default.xml
./repo sync


# Build
mkdir -p ./gki202311-out/11136126
DIST_DIR=./gki202311-out/11136126 BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh -j16
