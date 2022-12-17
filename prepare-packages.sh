#!/bin/sh

set -e

if [ -z $BUILDROOT ]; then
 echo "please define BUILDROOT" >&2
 exit 1
fi
BASE=$BUILDROOT/bin


PKG1=packages
PKG2=targets/ramips/mt7621/packages

x=$PWD
cd $BASE
tar cf $x/pkg.tar $PKG1 $PKG2

echo "src/gz openwrt_core file:///tmp/$PKG2" > $x/distfeeds.conf
echo "src/gz openwrt_base file:///tmp/$PKG1/mipsel_24kc/base" >> $x/distfeeds.conf
echo "src/gz openwrt_packages file:///tmp/$PKG1/mipsel_24kc/packages" >> $x/distfeeds.conf
echo "src/gz openwrt_luci file:///tmp/$PKG1/mipsel_24kc/luci" >> $x/distfeeds.conf
cd $x
tar rf $x/pkg.tar distfeeds.conf
