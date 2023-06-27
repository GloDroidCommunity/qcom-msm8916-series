#!/bin/bash

TARGETDEV=$1

if [ -z "$TARGETDEV" ] ; then
	TARGETDEV=idol347
fi

if [ ! -d devices/"$TARGETDEV" ] ; then
	echo Unknow device "$TARGETDEV"
	exit 1
fi

echo Building the Android for "$TARGETDEV"
pushd aosptree
. build/envsetup.sh
lunch "$TARGETDEV"-userdebug

make -j15 || make -j1
# Unknown targets after disabling BOARD_USES_GLODROID_MAKE_TARGETS
#make images -k || make images -j1
#make sdcard
popd
