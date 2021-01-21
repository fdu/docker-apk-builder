#!/bin/bash

function build_apk() {
  echo "Building $1..."
  cd
  git clone $2 -b $3 $1
  cd $1
  ./gradlew $4
}

build_apk	fdroid		https://github.com/f-droid/fdroidclient			1.11	assembleRelease
build_apk	signal		https://github.com/signalapp/Signal-Android		v5.2.3	assemblePlayProdRelease
#build_apk	telegram	https://github.com/Telegram-FOSS-Team/Telegram-FOSS	v7.3.1	assembleAfatRelease
