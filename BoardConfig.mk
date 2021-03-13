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

LOCAL_PATH := $(cal my-dir)

#CPU
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp  -DQCOM_HARDWARE
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64
TARGET_ARCH_VARIANT_CPU    := cortex-a9
TARGET_CPU_ABI             := armeabi-v7a
TARGET_CPU_ABI2            := armeabi
TARGET_CPU_SMP             := true
TARGET_CPU_VARIANT         := krait
TARGET_ARCH                := arm
TARGET_ARCH_VARIANT        := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET             := true
TARGET_KRAIT_BIONIC_PLDOFFS          := 10
TARGET_KRAIT_BIONIC_PLDTHRESH        := 10
TARGET_KRAIT_BIONIC_BBTHRESH         := 64
TARGET_KRAIT_BIONIC_PLDSIZE          := 64

#Kernel
BOARD_KERNEL_BASE      := 0x80200000
BOARD_KERNEL_PAGESIZE  := 2048
BOARD_KERNEL_CMDLINE   := console=null androidboot.hardware=aries ehci-hcd.park=3 maxcpus=2
#BOARD_RAMDISK_OFFSET   := 0x02000000
#BOARD_MKBOOTIMG_ARGS   := --ramdisk_offset 0x02000000
BOARD_FORCE_RAMDISK_ADDRESS := 0x82200000
TARGET_KERNEL_SOURCE   := kernel/xiaomi/aries
TARGET_KERNEL_CONFIG   := aries-perf_defconfig

#Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := aries
TARGET_BOOTLOADER_NAME       := aries

#Platform
TARGET_BOARD_PLATFORM            := msm8960
TARGET_BOARD_PLATFORM_GPU        := qcom-adreno200
BOARD_USES_QCOM_HARDWARE         := true
TARGET_USES_QCOM_BSP             := true
TARGET_NO_RADIOIMAGE             := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_BOARD_INFO_FILE           := device/xiaomi/aries/board-info.txt

#Graphics
TARGET_USES_ION             := true
USE_OPENGL_RENDERER         := true
TARGET_USES_C2D_COMPOSITION := true
BOARD_EGL_CFG               := device/xiaomi/aries/configs/egl.cfg
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Audio
BOARD_USES_ALSA_AUDIO  := true

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/aries/bluetooth

# Wifi
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

#File System
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 15728640 # 15M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640 # 15M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912 # 512M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3758096384 # 3.5G
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
#COMMON_GLOBAL_CFLAGS       += -DMR0_CAMERA_BLOB

# GPS
BOARD_USES_QCOM_GPS := true

#USB & Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR   := true
BOARD_VOLD_MAX_PARTITIONS          := 36

#Vibrator


# GPS
BOARD_HAVE_NEW_QC_GPS := true

#Other
ENABLE_WEBGL := true
ENABLE_AUTOFILL := true
TARGET_FORCE_CPU_UPLOAD := true
#DYNAMIC_SHARED_LIBV8SO := true

-include vendor/xiaomi/aries/BoardConfigVendor.mk
