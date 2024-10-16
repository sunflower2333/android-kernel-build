#!/bin/bash
# Download repo
sudo apt update
sudo apt install repo

cd android-kernel
repo init -u https://android.googlesource.com/kernel/manifest -b 226a9632f13d
mv a.xml .repo/manifests/default.xml
repo sync


# Build
mkdir -p ./gki202311-out/11136126
DIST_DIR=./gki202311-out/11136126 BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh -j16
