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

PRODUCT_COPY_FILES += device/htc/primoc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/primoc/init.primoc.rc:root/init.primoc.rc \
    device/htc/primoc/ueventd.primoc.rc:root/ueventd.primoc.rc

#PRODUCT_COPY_FILES += \
#    frameworks/native/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

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

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.primoc \
    lights.primoc \
    sensors.primoc
	
PRODUCT_PACKAGES += \
    audio_policy.msm7x30 \
    audio.primary.msm7x30

# idc files
PRODUCT_COPY_FILES += \
    device/htc/primoc/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/primoc/idc/primoc-keypad.idc:system/usr/idc/primoc-keypad.idc \
    device/htc/primoc/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primoc/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primoc/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc
    
# Keychars
PRODUCT_COPY_FILES += \
    device/htc/primoc/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/primoc/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primoc/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primoc/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primoc/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/primoc/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/primoc/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl \
    device/htc/primoc/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primoc/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/primoc/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/primoc/media_profiles.xml:system/etc/media_profiles.xml

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/primoc/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/primoc/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/primoc/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/primoc/dsp/audio_effects.conf.csv:system/etc/audio_effects.conf \
    device/htc/primoc/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/primoc/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/primoc/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/primoc/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/primoc/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/primoc/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/primoc/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/primoc/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/primoc/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/primoc/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/primoc/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/primoc/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/primoc/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/primoc/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/primoc/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/primoc/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/primoc/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/primoc/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt
    
# Audio libraries
PRODUCT_COPY_FILES += \
	device/htc/primoc/lib/hw/audio.a2dp.default.so:system/lib/hw/audio.a2dp.default.so \
	device/htc/primoc/lib/hw/audio.primary.default.so:system/lib/hw/audio.primary.default.so \
	device/htc/primoc/lib/hw/audio.primary.msm7x30.so:system/lib/hw/audio.primary.msm7x30.so \
	device/htc/primoc/lib/hw/audio_policy.default.so:system/lib/hw/audio_policy.default.so \
	device/htc/primoc/lib/hw/audio_policy.msm7x30.so:system/lib/hw/audio_policy.msm7x30.so \
	device/htc/primoc/lib/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/primoc/lib/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
	device/htc/primoc/lib/libaudioflinger.so:/system/lib/libaudioflinger.so

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/primoc/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    device/htc/primoc/lib/libv8.so:obj/lib/libv8.so

# proprietary files
PRODUCT_COPY_FILES += \
	device/htc/primoc/bin/awb_camera:/system/bin/awb_camera \
	device/htc/primoc/bin/bma150_usr:/system/bin/bma150_usr \
	device/htc/primoc/bin/logcat2:/system/bin/logcat2 \
	device/htc/primoc/bin/lsc_camera:/system/bin/lsc_camera \
	device/htc/primoc/bin/rmt_storage:/system/bin/rmt_storage \
	device/htc/primoc/bin/zcb:/system/bin/zcb \
	device/htc/primoc/firmware/default.acdb:system/etc/firmware/default.acdb \
	device/htc/primoc/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
	device/htc/primoc/firmware/default_org_wb.acdb:system/etc/firmware/default_org_wb.acdb \
	device/htc/primoc/lib/egl/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
	device/htc/primoc/lib/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
	device/htc/primoc/lib/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
	device/htc/primoc/lib/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
	device/htc/primoc/lib/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
	device/htc/primoc/lib/libC2D2.so:/system/lib/libC2D2.so \
	device/htc/primoc/lib/libgemini.so:/system/lib/libgemini.so \
	device/htc/primoc/lib/libgsl.so:/system/lib/libgsl.so \
	device/htc/primoc/lib/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
	device/htc/primoc/lib/libhtc_ril.so:/system/lib/libhtc_ril.so \
	device/htc/primoc/lib/libmmipl.so:/system/lib/libmmipl.so \
	device/htc/primoc/lib/libmmjpeg.so:/system/lib/libmmjpeg.so \
	device/htc/primoc/lib/liboemcamera.so:/system/lib/liboemcamera.so \
	device/htc/primoc/lib/libOpenVG.so:/system/lib/libOpenVG.so \
	device/htc/primoc/lib/libposteffect.so:/system/lib/libposteffect.so \
	device/htc/primoc/lib/libsc-a2xx.so:/system/lib/libsc-a2xx.so \
	device/htc/primoc/lib/libv8.so:system/lib/libv8.so

# wifi
PRODUCT_COPY_FILES += \
	device/htc/primoc/firmware/BCM4330B1_002.001.003.0833.0845.hcd:system/etc/firmware/BCM4330B1_002.001.003.0833.0845.hcd \
	device/htc/primoc/firmware/fw_bcm4330_b1.bin:system/etc/firmware/fw_bcm4330_b1.bin \
	device/htc/primoc/firmware/fw_bcm4330_b2.bin:system/etc/firmware/fw_bcm4330_b2.bin \
	device/htc/primoc/firmware/fw_bcm4330_apsta_b1.bin:system/etc/firmware/fw_bcm4330_apsta_b1.bin \
	device/htc/primoc/firmware/fw_bcm4330_apsta_b2.bin:system/etc/firmware/fw_bcm4330_apsta_b2.bin \
	device/htc/primoc/firmware/fw_bcm4330_p2p_b1.bin:system/etc/firmware/fw_bcm4330_p2p_b1.bin \
	device/htc/primoc/firmware/fw_bcm4330_p2p_b2.bin:system/etc/firmware/fw_bcm4330_p2p_b2.bin

# camera
PRODUCT_COPY_FILES += \
	device/htc/primoc/lib/hw/camera.default.so:system/lib/hw/camera.default.so \
	device/htc/primoc/lib/libOlaEngine.so:system/lib/libOlaEngine.so \
	device/htc/primoc/lib/libcamera_client.so:system/lib/libcamera_client.so \
	device/htc/primoc/lib/libcameraface.so:system/lib/libcameraface.so \
	device/htc/primoc/lib/libcamerapp.so:system/lib/libcamerapp.so \
	device/htc/primoc/lib/libcameraservice.so:system/lib/libcameraservice.so \
	device/htc/primoc/lib/libcentralZoomTransition.so:system/lib/libcentralZoomTransition.so \
	device/htc/primoc/lib/libchromatix_s5k4e5yx_default_video.so:system/lib/libchromatix_s5k4e5yx_default_video.so \
	device/htc/primoc/lib/libchromatix_s5k4e5yx_hdr.so:system/lib/libchromatix_s5k4e5yx_hdr.so \
	device/htc/primoc/lib/libchromatix_s5k4e5yx_hfr.so:system/lib/libchromatix_s5k4e5yx_hfr.so \
	device/htc/primoc/lib/libchromatix_s5k4e5yx_hfr_4x.so:system/lib/libchromatix_s5k4e5yx_hfr_4x.so \
	device/htc/primoc/lib/libchromatix_s5k4e5yx_preview.so:system/lib/libchromatix_s5k4e5yx_preview.so \
	device/htc/primoc/lib/libcubicRotateTransition.so:system/lib/libcubicRotateTransition.so \
	device/htc/primoc/lib/libmm-color-convertor.so:system/lib/libmm-color-convertor.so \
	device/htc/primoc/lib/libmmcamera_rawchipproc.so:system/lib/libmmcamera_rawchipproc.so \
	device/htc/primoc/lib/libmmosal.so:system/lib/libmmosal.so \
	device/htc/primoc/lib/libmmparser.so:system/lib/libmmparser.so \
	device/htc/primoc/lib/libmmparser_divxdrmlib.so:system/lib/libmmparser_divxdrmlib.so \
	device/htc/primoc/lib/libmmparser_lite.so:system/lib/libmmparser_lite.so \
	device/htc/primoc/lib/libzoomTransition.so:system/lib/libzoomTransition.so

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/primoc/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/bcmdhd.ko:system/lib/modules/bcmdhd.ko


# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# HTC Audio
$(call inherit-product, device/htc/primoc/media_a1026.mk)
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)
