$(call inherit-product, device/htc/primoc/full_primoc.mk)

PRODUCT_RELEASE_NAME := One_V

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc_primoc/primoc:4.0.3/IML74K/63812.6:user/release-keys PRIVATE_BUILD_DESC="1.08.652.6 CL63812 release-keys"

PRODUCT_NAME := cm_primoc
PRODUCT_DEVICE := primoc
