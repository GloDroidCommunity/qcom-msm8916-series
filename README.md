# Android 13 for Qualcomm MSM8909/MSM8916/MSM8939 devices based on the GloDroid project

[![GloDroid](https://img.shields.io/badge/GLODROID-PROJECT-blue)](https://github.com/GloDroid/glodroid_manifest)
[![ProjectStatus](https://img.shields.io/badge/PROJECT-STATUS-yellowgreen)](https://github.com/GloDroidCommunity/qcom-msm8916-series/issues/1)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## :warning: Warning :warning:

This project is a free and open-source initiative maintained by a group of volunteers. It is provided "as is" without any warranties or guarantees. The user is fully responsible for any issues arising from using the project.

## About

This project builds upon [lk2nd](https://github.com/msm8916-mainline/lk2nd), [msm8916-mainline kernel](https://github.com/msm8916-mainline/linux) and postmarketOS (pmOS) for [MSM8909](https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_210_(MSM8909)), [MSM8916](https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_410/412_(MSM8916)) and [MSM8939](https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_415/615/616_(MSM8929/MSM8939)).
If your device appears in those wiki pages with `Mainline Y`, adding support for it in this GloDroid repo should be fairly easy (example: vknecht@1fad6476fc3cd22cd818486c8f56f74b5627d44e). Otherwise, see [MSM8916 Mainlining page](https://wiki.postmarketos.org/wiki/MSM8916_Mainlining) first.

## Supported devices

| Name | Codename | SoC | Downloads | News | Informations |
|------|----------|-----|-----------|------|--------------|
| Alcatel OneTouch Idol 3 4.7" (6039\*) | idol347 | MSM8916 | [AndroidFileHost](https://androidfilehost.com/?w=files&flid=339479) | [XDA thread](https://forum.xda-developers.com/t/rom-aosp-lineageos-for-idol3-idol347-with-close-to-mainline-kernel.4533061/) | [pmOS wiki](https://wiki.postmarketos.org/wiki/Alcatel_Idol_3_4.7%22_(alcatel-idol347)) |
| Alcatel OneTouch Idol 3 5.5" (6045\*) | idol3 | MSM8939 | [AndroidFileHost](https://androidfilehost.com/?w=files&flid=339480) | [XDA thread](https://forum.xda-developers.com/t/rom-aosp-lineageos-for-idol3-idol347-with-close-to-mainline-kernel.4533061/) | [pmOS wiki](https://wiki.postmarketos.org/wiki/Alcatel_Idol_3_5.5%22_(alcatel-idol3)) |
| Huawei Honor 5X | kiwi | MSM8939v2 | [AndroidFileHost](https://www.androidfilehost.com/?w=files&flid=339802) | | [pmOS wiki](https://wiki.postmarketos.org/wiki/Huawei_Honor_5X/GR5_(2016)_(huawei-kiwi)) |

## Flashing

* device off, go to lk2nd menu by pressing `Power` + `Vol-` buttons
* `fastboot flash boot boot.img`
* `fastboot flash cache vendor.img`
* `fastboot flash userdata userdata.img`
* `fastboot flash system system.img`
* select START using `Vol+` or `Vol-` buttons if needed, then press `Power` button

First boot might take 2 or 3 minutes...
Please ignore the `Contact the manufacturer` message on boot. Android shows it because we're using a kernel that is not supported officially for Android-13.

## Building from source

Before building, ensure your system has at least 32GB of RAM, a swap file is at least 8GB, and 300GB of free disk space available.
We recommend using the latest laptops to get good performance. E.g., the HP ENVY x360 model15-ds1083cl takes about 5 hours to build the project.

### Install system packages

Only  Ubuntu 22.04 LTS is supported, but one can use Docker on other distros.
See [this Dockerfile](https://github.com/GloDroid/glodroid_manifest/blob/master/.docker/Dockerfile) and add `git-lfs` package to the list if you want to build LineageOS.

- [Install AOSP required packages](https://source.android.com/setup/build/initializing)
```bash
sudo apt-get install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
```

- Install additional packages
```bash
sudo apt-get install -y swig libssl-dev flex bison device-tree-compiler mtools git gettext libncurses5 libgmp-dev libmpc-dev cpio rsync dosfstools kmod gdisk lz4 meson cmake libglib2.0-dev git-lfs
```

- Install additional packages (for building mesa3d, libcamera, and other meson-based components)
```bash
sudo apt-get install -y python3-pip pkg-config python3-dev ninja-build
sudo pip3 install mako jinja2 ply pyyaml pyelftools
```

- Install the `repo` tool
```bash
sudo apt-get install -y python-is-python3 wget
wget -P ~/bin http://commondatastorage.googleapis.com/git-repo-downloads/repo
chmod a+x ~/bin/repo
```

**NOTE: After this step, you may need to log out and log in to the system to make $HOME/bin added to the PATH environment variable.**

### Fetching the sources and building the project

```bash
git clone https://github.com/GloDroidCommunity/qcom-msm8916-series.git
cd qcom-msm8916-series
```

### Building AOSP

```bash
./unfold_aosp.sh && ./build.sh codename-of-your-device
```

**NOTE: If you're using `git` for the first time, it may ask you to configure the user name and email address and confirm the colored terminal.
Please follow the suggestion you see on the screen in this case.**

### Building LineageOS

To enable GMS (microg), set the environment variable `export WITH_GMS=true`.

```bash
./unfold_lineageos.sh && ./build.sh codename-of-your-device
```

### Notes

- Depending on your hardware and internet connection, downloading and building may take 8h or more.
- After the successful build, find the fastboot images at `./out/codename-of-your-device`.
- To enable GloDroid's prebuild apps (like F-Droid, skytube, Firefox, etc.), set the environment variable before building `export GD_NO_DEFAULT_APPS=false`.

