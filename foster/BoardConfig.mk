#
# Copyright (C) 2014 The CyanogenMod Project
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

-include device/nvidia/shield-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/nvidia/shieldtablet/include

# CPU options
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true

BOARD_BUILD_BOOTLOADER := true

TARGET_KERNEL_DT_NAME ?= tegra124-ardbeg

# Board
TARGET_BOOTLOADER_BOARD_NAME := tegra
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_FAMILY := t12x
TARGET_NO_RADIOIMAGE := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Kernel
# KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.9/bin
# KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
# TARGET_KERNEL_SOURCE := kernel
# TARGET_KERNEL_CONFIG := tegra12_android_defconfig
BOARD_KERNEL_CMDLINE := androidboot.hardware=tegra androidboot.selinux=permissive

# FS
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 13090422784
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_VENDORIMAGE_PARTITION_SIZE := 419430400
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

# PowerHAL
TARGET_POWERHAL_VARIANT := tegra

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TEGRA_HDMI := true

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS_AUDIO), TRUE)
USE_CUSTOM_AUDIO_POLICY := 1
else
USE_CUSTOM_AUDIO_POLICY := 0
endif

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nvidia/foster/bluetooth

# Graphics
USE_OPENGL_RENDERER := true
BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Per-application sizes for shader cache
MAX_EGL_CACHE_SIZE := 4194304
MAX_EGL_CACHE_ENTRY_SIZE := 262144

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/foster/initfiles/fstab.tegra

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_BUS := PCIE

#BOARD_HARDWARE_CLASS := device/nvidia/shieldtablet/cmhw/

# sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/foster/sepolicy/

# seccomp policy
BOARD_SECCOMP_POLICY = device/nvidia/platform/ardbeg/seccomp/

