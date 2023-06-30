LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := idol3_firmware
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)

# Create mount points for device-specific firmware partitions
LOCAL_POST_INSTALL_CMD := mkdir -p $(addprefix $(TARGET_OUT_VENDOR)/, \
			  odm/modem odm/persist);

# Create directory for wlan NV BIN file
LOCAL_POST_INSTALL_CMD += mkdir -p $(addprefix $(TARGET_OUT_VENDOR)/, \
			  firmware/wlan/prima);

# Symlink device-specific firmware files in $(TARGET_OUT_VENDOR)/firmware/
LOCAL_POST_INSTALL_CMD += \
    ln -sf /vendor/odm/modem/image/mba.mbn $(TARGET_OUT_VENDOR)/firmware/mba.mbn; \
    ln -sf /vendor/odm/modem/image/modem.b00 $(TARGET_OUT_VENDOR)/firmware/modem.b00; \
    ln -sf /vendor/odm/modem/image/modem.b01 $(TARGET_OUT_VENDOR)/firmware/modem.b01; \
    ln -sf /vendor/odm/modem/image/modem.b02 $(TARGET_OUT_VENDOR)/firmware/modem.b02; \
    ln -sf /vendor/odm/modem/image/modem.b03 $(TARGET_OUT_VENDOR)/firmware/modem.b03; \
    ln -sf /vendor/odm/modem/image/modem.b04 $(TARGET_OUT_VENDOR)/firmware/modem.b04; \
    ln -sf /vendor/odm/modem/image/modem.b05 $(TARGET_OUT_VENDOR)/firmware/modem.b05; \
    ln -sf /vendor/odm/modem/image/modem.b06 $(TARGET_OUT_VENDOR)/firmware/modem.b06; \
    ln -sf /vendor/odm/modem/image/modem.b07 $(TARGET_OUT_VENDOR)/firmware/modem.b07; \
    ln -sf /vendor/odm/modem/image/modem.b08 $(TARGET_OUT_VENDOR)/firmware/modem.b08; \
    ln -sf /vendor/odm/modem/image/modem.b10 $(TARGET_OUT_VENDOR)/firmware/modem.b10; \
    ln -sf /vendor/odm/modem/image/modem.b11 $(TARGET_OUT_VENDOR)/firmware/modem.b11; \
    ln -sf /vendor/odm/modem/image/modem.b14 $(TARGET_OUT_VENDOR)/firmware/modem.b14; \
    ln -sf /vendor/odm/modem/image/modem.b15 $(TARGET_OUT_VENDOR)/firmware/modem.b15; \
    ln -sf /vendor/odm/modem/image/modem.b16 $(TARGET_OUT_VENDOR)/firmware/modem.b16; \
    ln -sf /vendor/odm/modem/image/modem.b17 $(TARGET_OUT_VENDOR)/firmware/modem.b17; \
    ln -sf /vendor/odm/modem/image/modem.b18 $(TARGET_OUT_VENDOR)/firmware/modem.b18; \
    ln -sf /vendor/odm/modem/image/modem.b19 $(TARGET_OUT_VENDOR)/firmware/modem.b19; \
    ln -sf /vendor/odm/modem/image/modem.b20 $(TARGET_OUT_VENDOR)/firmware/modem.b20; \
    ln -sf /vendor/odm/modem/image/modem.b23 $(TARGET_OUT_VENDOR)/firmware/modem.b23; \
    ln -sf /vendor/odm/modem/image/modem.b24 $(TARGET_OUT_VENDOR)/firmware/modem.b24; \
    ln -sf /vendor/odm/modem/image/modem.b25 $(TARGET_OUT_VENDOR)/firmware/modem.b25; \
    ln -sf /vendor/odm/modem/image/modem.b27 $(TARGET_OUT_VENDOR)/firmware/modem.b27; \
    ln -sf /vendor/odm/modem/image/modem.b28 $(TARGET_OUT_VENDOR)/firmware/modem.b28; \
    ln -sf /vendor/odm/modem/image/modem.mdt $(TARGET_OUT_VENDOR)/firmware/modem.mdt; \
    ln -sf /vendor/odm/modem/image/wcnss.b00 $(TARGET_OUT_VENDOR)/firmware/wcnss.b00; \
    ln -sf /vendor/odm/modem/image/wcnss.b01 $(TARGET_OUT_VENDOR)/firmware/wcnss.b01; \
    ln -sf /vendor/odm/modem/image/wcnss.b02 $(TARGET_OUT_VENDOR)/firmware/wcnss.b02; \
    ln -sf /vendor/odm/modem/image/wcnss.b04 $(TARGET_OUT_VENDOR)/firmware/wcnss.b04; \
    ln -sf /vendor/odm/modem/image/wcnss.b06 $(TARGET_OUT_VENDOR)/firmware/wcnss.b06; \
    ln -sf /vendor/odm/modem/image/wcnss.b09 $(TARGET_OUT_VENDOR)/firmware/wcnss.b09; \
    ln -sf /vendor/odm/modem/image/wcnss.b10 $(TARGET_OUT_VENDOR)/firmware/wcnss.b10; \
    ln -sf /vendor/odm/modem/image/wcnss.b11 $(TARGET_OUT_VENDOR)/firmware/wcnss.b11; \
    ln -sf /vendor/odm/modem/image/wcnss.mdt $(TARGET_OUT_VENDOR)/firmware/wcnss.mdt; \
    ln -sf /vendor/odm/persist/WCNSS_tct_wlan_nv.bin $(TARGET_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin;

# Symlink non-splitted venus fimware for backward compatibility
LOCAL_POST_INSTALL_CMD += \
    mkdir -p $(TARGET_OUT_VENDOR)/firmware/qcom/venus-1.8/ ; \
    ln -sf venus.mbn $(TARGET_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.mdt;

include $(BUILD_PHONY_PACKAGE)
