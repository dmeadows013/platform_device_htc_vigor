# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := vigor

TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/vigor/device_vigor.mk)

# Device naming
PRODUCT_DEVICE := vigor
PRODUCT_NAME := cm_vigor
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC Rezound
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vigor BUILD_FINGERPRINT=verizon_wwe/htc_vigor/vigor:4.1.1/JRO03O/436457.2:user/release-keys PRIVATE_BUILD_DESC="4.03.605.2 CL436457 release-keys" BUILD_NUMBER=436457
