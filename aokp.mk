PRODUCT_RELEASE_NAME := AOKP

# Set date
NOW=$(shell date +"%d-%m-%Y")

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/htc/marvel/aokp_primoc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := primoc
PRODUCT_NAME   := aokp_primoc
PRODUCT_BRAND  := htc
PRODUCT_MODEL  := One V
PRODUCT_MANUFACTURER := HTC
PRODUCT_VERSION_DEVICE_SPECIFIC := -AOKP-NIGHTLY-$(NOW)

# AOKP_RELEASE := true
AOKP_BUILDTYPE := UNOFFICIAL
AOKP_EXTRAVERSION := AOKP-NIGHTLY-$(NOW)

BUILD_ID := simonsimons34-AOKP-$(NOW)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_marvel BUILD_ID=$(BUILD_ID) BUILD_DISPLAY_ID=$(BUILD_ID) BUILD_FINGERPRINT=aokp/htc_marvel/marvel:4.0.4/aokp$(BUILD_ID)/0.1:user/release-keys PRIVATE_BUILD_DESC="0.1 simonsimons34 release-keys"
