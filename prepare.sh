#!/bin/bash

ROOTFS="$(pwd)/rootfs"

if [[ ! -d $ROOTFS/opt ]]; then
	mkdir -p $ROOTFS/opt
fi
if [[ ! -d $ROOTFS/lib ]]; then
	mkdir -p $ROOTFS/lib
fi

JDK_MINOR=66
JDK_BUILD=17
JDK_ARCHIVE="jdk-8u${JDK_MINOR}-linux-x64.tar.gz"

JDK_DIR=$ROOTFS/opt/jdk1.8.0_$JDK_MINOR
if [ ! -d $JDK_DIR ]; then
	if [ ! -f jdk-8u66-linux-x64.tar.gz ]; then
		wget --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u${JDK_MINOR}-b${JDK_BUILD}/jdk-8u${JDK_MINOR}-linux-x64.tar.gz
	fi
	tar xzf $JDK_ARCHIVE -C $ROOTFS/opt
fi

if [[ ! -f $ROOTFS/lib/libgcc_s.so.1 ]]; then
	TMP_DIR=/tmp/minimal-java.$$
	mkdir -p $TMP_DIR

	cd $TMP_DIR
	wget http://launchpadlibrarian.net/180165770/libgcc1_4.9.1-0ubuntu1_amd64.deb
	ar vx libgcc1_4.9.1-0ubuntu1_amd64.deb
	tar xJf data.tar.xz
	cp lib/x86_64-linux-gnu/libgcc_s.so.1 $ROOTFS/lib

	rm -rf $TMP_DIR
fi
