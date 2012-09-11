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
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8660 configs
$(call inherit-product, device/htc/msm8660-common/msm8660.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/vigor/overlay

# GPS and Light
PRODUCT_PACKAGES += \
    gps.vigor \
    lights.vigor

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/htc/msm8660-common/firmware/bcm4330.hcd:system/vendor/firmware/bcm4330.hcd

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/vigor/ramdisk/fstab.vigor:root/fstab.vigor \
    device/htc/vigor/ramdisk/init.vigor.rc:root/init.vigor.rc \
    device/htc/vigor/ramdisk/init.vigor.usb.rc:root/init.vigor.usb.rc \
    device/htc/vigor/ramdisk/ueventd.vigor.rc:root/ueventd.vigor.rc

## recovery and custom charging
PRODUCT_COPY_FILES += \
    device/htc/vigor/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/vigor/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/vigor/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/vigor/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/vigor/recovery/sbin/htcbatt:recovery/root/sbin/htcbatt

# Some misc configeration files
PRODUCT_COPY_FILES += \
    device/htc/vigor/vold.fstab:system/etc/vold.fstab

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/vigor/keychars/vigor-keypad.kcm:system/usr/keychars/vigor-keypad.kcm \
    device/htc/vigor/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/vigor/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/vigor/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/vigor/keylayout/vigor-keypad.kl:system/usr/keylayout/vigor-keypad.kl
    
# Camera
PRODUCT_PACKAGES += \
	Camera

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/vigor/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/vigor/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# HTC BT Audio tune
PRODUCT_COPY_FILES += device/htc/vigor/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# QC thermald config
PRODUCT_COPY_FILES += device/htc/vigor/configs/thermald.conf:system/etc/thermald.conf

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/vigor/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/vigor/dsp/AdieHWCodec_BEATS_HW.csv:system/etc/AdieHWCodec_BEATS_HW.csv \
    device/htc/vigor/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/vigor/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/vigor/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/vigor/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/vigor/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/vigor/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/vigor/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/vigor/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/vigor/dsp/soundimage/srsfx_trumedia_music_wide.cfg:system/etc/soundimage/srsfx_trumedia_music_wide.cfg \
    device/htc/vigor/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/vigor/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/vigor/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/vigor/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Custom media config for HTC camera
PRODUCT_COPY_FILES += \
    device/htc/msm8660-common/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/vigor/configs/media_profiles.xml:system/etc/media_profiles.xml

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/vigor/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/htc/vigor/modules/bcmdhd.ko:/system/lib/modules/bcmdhd.ko

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/vigor/vigor-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/vigor/media_a1026.mk)

## htc audio settings
$(call inherit-product, device/htc/vigor/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
