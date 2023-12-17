#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from AGTA device
$(call inherit-product, device/hmd/AGTA/device.mk)

PRODUCT_DEVICE := AGTA
PRODUCT_NAME := lineage_AGTA
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia T21
PRODUCT_MANUFACTURER := hmd

PRODUCT_GMS_CLIENTID_BASE := android-hmd

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="P19616AA1-user 12 SP1A.210812.016 00WW_1_320 release-keys"
