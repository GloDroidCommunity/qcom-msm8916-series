# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2023 The GloDroid project

BC_PATH := $(patsubst $(CURDIR)/%,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

include glodroid/configuration/common/board-common.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(BC_PATH)/sepolicy/vendor

BOARD_MESA3D_GALLIUM_DRIVERS := freedreno

KERNEL_DEFCONFIG := $(BOARD_KERNEL_SRC_DIR)/arch/arm64/configs/msm8916_defconfig
KERNEL_FRAGMENTS := $(BOARD_KERNEL_SRC_DIR)/kernel/configs/android.config \
		    $(BOARD_KERNEL_SRC_DIR)/kernel/configs/aosp.config \

# User image 11079 MiB
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := $(shell echo $$(( 11079 * 1024 * 1024 )))

# System image 2560 MiB
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := $(shell echo $$(( 2560 * 1024 * 1024 )))

# Vendor image 256 MiB
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE   := $(shell echo $$(( 256 * 1024 * 1024 )))

# Boot image 63 MiB (keep 1 MiB for lk2nd)
BOARD_BOOTIMAGE_PARTITION_SIZE := $(shell echo $$(( 63 * 1024 * 1024 )))
