#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL aries devices, and
# are also specific to aries devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/xiaomi/aries/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi


# Ramdisk
PRODUCT_COPY_FILES += \
    device/xiaomi/aries/ramdisk/chargeonlymode:root/sbin/chargeonlymode \
    device/xiaomi/aries/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/xiaomi/aries/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/xiaomi/aries/ramdisk/init.aries.rc:root/init.aries.rc \
    device/xiaomi/aries/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/xiaomi/aries/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/xiaomi/aries/ramdisk/init.aries.usb.rc:root/init.aries.usb.rc \
    device/xiaomi/aries/ramdisk/init.target.rc:root/init.target.rc \
    device/xiaomi/aries/ramdisk/ueventd.aries.rc:root/ueventd.aries.rc \
    device/xiaomi/aries/ramdisk/fstab.aries:root/fstab.aries \
    device/xiaomi/aries/ramdisk/init:root/init 

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml 

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

# BT
PRODUCT_PACKAGES += \
    hci_qcomm_init

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libI420colorconvert \
    libmm-omxcore \
    libstagefrighthw

# Light
PRODUCT_PACKAGES += \
    lights.msm8960

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# OpenglES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.vns.mode=2 \
    af.resampler.quality=255 \
    mpq.audio.decode=true \
    ro.qcom.audio.ssr=true

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

#Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs \
    setup_fs

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0

# Debugging
PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.enable=1 \
    persist.service.adb.enable=1

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
