#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += device/htc/primoc/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/root/init.primoc.rc:root/init.primoc.rc \
    device/htc/primoc/prebuilt/root/init.usb.rc:root/init.usb.rc \
    device/htc/primoc/prebuilt/root/init.rc:root/init.rc \
    device/htc/primoc/prebuilt/root/ueventd.primoc.rc:root/ueventd.primoc.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y
	
# Carrier Info
CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

# Property Overides for carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.primoc \
    lights.primoc \
    sensors.primoc

# Additional packages
PRODUCT_PACKAGES += \
    GooManager \
    PopNetwork

# idc files
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/primoc/prebuilt/usr/idc/primoc-keypad.idc:system/usr/idc/primoc-keypad.idc \
    device/htc/primoc/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primoc/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primoc/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/primoc/prebuilt/usr/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/primoc/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primoc/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primoc/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primoc/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/primoc/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/primoc/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/prebuilt/usr/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl \
    device/htc/primoc/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primoc/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml	

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/primoc/prebuilt/root/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko


# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# pull qcom vendor
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

# HTC Audio
$(call inherit-product, device/htc/primoc/media_a1026.mk)
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# Goo updater app
PRODUCT_PROPERTY_OVERRIDES += \
ro.goo.developerid=jmz \
ro.goo.rom=cm9primoc \
ro.goo.version=3
