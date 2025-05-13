#!/bin/bash
product_name=$1

export ARCH=arm64
export SUBARCH=arm64
export TARGET_PRODUCT=$product_name
export PATH="${PWD}/toolchain/clang12/bin:$PATH"
export KBUILD_BUILD_VERSION="0"

echo "Product name: [$product_name]"
echo "kernel config: [${product_name}_user_defconfig]"

make O=out ARCH=arm64 CC=clang \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=aarch64-linux-gnu- \
${product_name}_user_defconfig \
xiaomi.config kernelsu.config

make -j24 O=out ARCH=arm64 CC=clang \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=aarch64-linux-gnu-
