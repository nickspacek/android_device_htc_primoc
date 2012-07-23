$(call inherit-product, device/htc/primou/full_primou.mk)

PRODUCT_RELEASE_NAME := One_V

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primou BUILD_FINGERPRINT=htc_europe/htc_primou/primou:2.3.5/GRJ90/156318.4:user/release-keys PRIVATE_BUILD_DESC="2.10.401.4 CL156318 release-keys"

PRODUCT_NAME := cm_primou
PRODUCT_DEVICE := primou

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Lloir
PRODUCT_VERSION_DEVICE_SPECIFIC := 1.0
