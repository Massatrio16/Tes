#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#




LOCAL_PATH := device/itel/S665L
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true


PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl-default \
    android.hardware.health@2.0-service 
    
TW_LOAD_VENDOR_MODULES := "goodix_fp.ko  modules.load modules.load.recovery msm_drm.ko sprd_audcp_boot.ko  fpsensor_fp.ko sprd_sensor.ko aw32257_charger.ko charger-manager.ko tran_charger.ko musb_hdrc.ko musb_sprd.ko"

 
# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl-1.2 \
    android.hardware.boot@1.0-impl-1.2.recovery \
vendor.sprd.hardware.boot@1.2

PRODUCT_PACKAGES += \
    unisoc.bootctrl.recovery \
unisoc.bootctrl \
bootctrl.default
    
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)


PRODUCT_PACKAGES_DEBUG += \
    update_engine_client
PRODUCT_PACKAGES_DEBUG += \
  unisoc.bootctrl
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload


# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B support
AB_OTA_UPDATER := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_SHIPPING_API_LEVEL := 31
# A/B




PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
