#!/bin/bash

echo Building the Android
pushd aosptree
. build/envsetup.sh
lunch idol347-userdebug
#lunch kiwi-userdebug

make -j15 || make -j1
# Unknown targets after disabling BOARD_USES_GLODROID_MAKE_TARGETS
#make images -k || make images -j1
#make sdcard
popd
