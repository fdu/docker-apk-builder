#!/bin/bash

export ANDROID_SDK_ROOT=/home/deb/android-sdk-linux
git clone --recurse-submodules https://github.com/topjohnwu/Magisk.git magisk
cd magisk
git checkout v22.1
./build.py ndk
./build.py all
