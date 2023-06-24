#!/bin/bash

echo Checking build vars
pushd aosptree
. build/envsetup.sh
lunch idol347-userdebug
#lunch kiwi-userdebug

get_build_var $1

popd
