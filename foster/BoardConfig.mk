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

TARGET_RELEASETOOLS_EXTENSIONS := device/nvidia/common

ifeq ($(SECURE_OS_BUILD),tlk)
    # enable secure HDCP for secure OS build
	BOARD_VENDOR_HDCP_ENABLED ?= true
	BOARD_ENABLE_SECURE_HDCP ?= 1
	BOARD_VENDOR_HDCP_PATH ?= vendor/nvidia/tegra/tests-partner/hdcp
endif

NV_BUILD_GL_SUPPORT ?= 0
# EGL_OPENGL_API support requires Android modifications only present in
# the NV and Generic Soc branches of Android.
ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
NV_BUILD_GL_SUPPORT := 1
endif
ifeq ($(NV_GENERIC_SOC),1)
NV_BUILD_GL_SUPPORT := 1
endif
ifeq ($(NV_EXPOSE_GLES_ONLY),true)
NV_BUILD_GL_SUPPORT := 0
endif

# If full OpenGL is built into the OS, then export the
# feature tag to Android, so that apps can filter on the
# feature in the Play Store
ifeq ($(NV_BUILD_GL_SUPPORT),1)
PRODUCT_COPY_FILES += \
    device/nvidia/common/com.nvidia.feature.opengl4.xml:system/etc/permissions/com.nvidia.feature.opengl4.xml
endif

BOARD_REMOVES_RESTRICTED_CODEC := false

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
# BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nvidia/foster/bluetooth
BOARD_HAVE_BLUETOOTH := false
# BOARD_HAVE_BLUETOOTH_BCM := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Per-application sizes for shader cache
MAX_EGL_CACHE_SIZE := 128450560
MAX_EGL_CACHE_ENTRY_SIZE := 262144

# GPU/EMC boosting for hwcomposer yuv packing
HWC_YUV_PACKING_CPU_FREQ_MIN := -1
HWC_YUV_PACKING_CPU_FREQ_MAX := -1
HWC_YUV_PACKING_CPU_FREQ_PRIORITY := 15
HWC_YUV_PACKING_GPU_FREQ_MIN := 691200
HWC_YUV_PACKING_GPU_FREQ_MAX := 998400
HWC_YUV_PACKING_GPU_FREQ_PRIORITY := 15
HWC_YUV_PACKING_EMC_FREQ_MIN := 106560

# GPU/EMC floor for glcomposer composition
HWC_GLCOMPOSER_CPU_FREQ_MIN := -1
HWC_GLCOMPOSER_CPU_FREQ_MAX := -1
HWC_GLCOMPOSER_CPU_FREQ_PRIORITY := 15
HWC_GLCOMPOSER_GPU_FREQ_MIN := 614400
HWC_GLCOMPOSER_GPU_FREQ_MAX := 998400
HWC_GLCOMPOSER_GPU_FREQ_PRIORITY := 15
HWC_GLCOMPOSER_EMC_FREQ_MIN := 4080

USE_E2FSPROGS := true
USE_OPENGL_RENDERER := true

# Allow this variable to be overridden to n for non-secure OS build
SECURE_OS_BUILD ?= y
ifeq ($(SECURE_OS_BUILD),y)
    SECURE_OS_BUILD := tlk
endif

# Uncomment below line to use Nvidia's GPU-accelerated RS driver by default
# OVERRIDE_RS_DRIVER := libnvRSDriver.so

# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/foster/initfiles/fstab.tegra

# Wifi related defines
BOARD_WLAN_DEVICE := pcie
CONFIG_CTRL_IFACE := y
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_pcie
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_pcie
#WIFI_BUS := PCIE

#BOARD_HARDWARE_CLASS := device/nvidia/shieldtablet/cmhw/

# sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/foster/sepolicy/

# seccomp policy
BOARD_SECCOMP_POLICY = device/nvidia/platform/ardbeg/seccomp/

