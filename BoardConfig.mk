# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
BOARD_PATH := device/nubia/nx609j

PRODUCT_SUPPORTS_BOOT_SIGNER := true
PRODUCT_SUPPORTS_VERITY := true
PRODUCT_VERITY_SIGNING_KEY := build/target/product/security/verity
BOARD_AVB_BOOT_KEY_PATH := build/target/product/security/verity
PRODUCT_DEFAULT_DEV_CERTIFICATE := build/target/product/security/verity

PRODUCT_FULL_TREBLE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
BOARD_VNDK_VERSION := current
BOARD_VNDK_RUNTIME_DISABLE := false
PRODUCT_SHIPPING_API_LEVEL := 27
TARGET_NO_RECOVERY := false
#BOARD_SEPOLICY_VERS := 30
BOARD_USES_VENDORIMAGE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Split selinux policy
PRODUCT_SEPOLICY_SPLIT := false
PRODUCT_SEPOLICY_SPLIT_OVERRIDE := false
PRODUCT_FULL_TREBLE_OVERRIDE := true

TARGET_USE_SDCLANG := true
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := nx609j,NX609J
TARGET_KERNEL_VERSION := 4.4
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := 6.0.2
TARGET_BOOTLOADER_BOARD_NAME := msm8998

TARGET_COPY_OUT_VENDOR := vendor

# Generic AOSP image does NOT support HWC1
TARGET_USES_HWC2 := true
# Set emulator framebuffer display device buffer count to 3
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# TODO(b/35790399): remove when b/35790399 is fixed.
BOARD_FLASH_BLOCK_SIZE := 512

USE_XML_AUDIO_POLICY_CONF := 1
TARGET_SYSTEM_AUDIO_EFFECTS := true

#Enable DRM plugins 64 bit compilation
TARGET_ENABLE_MEDIADRM_64 := true

# Platform
TARGET_BOARD_PLATFORM := msm8998
TARGET_BOARD_PLATFORM_GPU := qcom-adreno540

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true
TARGET_COMPILE_WITH_MSM_KERNEL := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true loop.max_part=7 androidboot.usbcontroller=a800000.dwc3 firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_CMDLINE += skip_initramfs rootwait ro init=/init root=/dev/dm-0 dm=\"system none ro,0 1 android-verity /dev/sda9\"
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/nubia/nx609j
TARGET_KERNEL_CONFIG := omni_nx609j_defconfig
TARGET_KERNEL_APPEND_DTB := true
BOARD_ROOT_EXTRA_FOLDERS := odm
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/bt_firmware:/bt_firmware /vendor/firmware_mnt:/firmware /mnt/vendor/persist:/persist

# partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 121497399296
BOARD_FLASH_BLOCK_SIZE := 131072

# global
TARGET_SPECIFIC_HEADER_PATH := $(BOARD_PATH)/include
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
TARGET_USES_MKE2FS := true

# Camera
TARGET_USES_QTI_CAMERA2CLIENT := true
USE_CAMERA_STUB := true
TARGET_USES_MEDIA_EXTENSIONS := false

# Disable secure discard because it's SLOW
BOARD_SUPPRESS_SECURE_ERASE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_PATH)/bluetooth
QCOM_BT_USE_BTNV := true
TARGET_QCOM_BLUETOOTH_VARIANT := caf-msm8998

# Wifi
TARGET_USES_QCOM_WCNSS_QMI       := false
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_NAME          := "wlan"
#WIFI_DRIVER_MODULE_ARG           := ""
WIFI_DRIVER_STATE_CTRL_PARAM     := "/dev/wlan"
WIFI_DRIVER_STATE_ON             := "ON"
WIFI_DRIVER_STATE_OFF            := "OFF"
WIFI_DRIVER_BUILT                := qca_cld3
WIFI_DRIVER_DEFAULT              := qca_cld3
WIFI_HIDL_FEATURE_AWARE          := true
#WIFI_DRIVER_LOAD_DELAY           := true

CONFIG_ACS := true
CONFIG_IEEE80211AC := true

# charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# power hal
TARGET_PROVIDES_POWERHAL := true
TARGET_USES_INTERACTION_BOOST := false

# ANT+
TARGET_USES_PREBUILT_ANT := true
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# HIDL
#DEVICE_MANIFEST_FILE := $(BOARD_PATH)/manifest.xml
#DEVICE_MATRIX_FILE := $(BOARD_PATH)/compatibility_matrix.xml

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# CNE and DPM
#TARGET_LDPRELOAD := libNimsWrap.so
BOARD_USES_QCNE := true

TARGET_SYSTEM_PROP := $(BOARD_PATH)/system.prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# audio effects
TARGET_SYSTEM_AUDIO_EFFECTS := true

# selinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(BOARD_PATH)/sepolicy
include vendor/omni/sepolicy/sepolicy.mk

BOARD_SECCOMP_POLICY += $(BOARD_PATH)/seccomp_policy

# for offmode charging
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# Recovery:Start
TARGET_RECOVERY_FSTAB := $(BOARD_PATH)/fstab.recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
