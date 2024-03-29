# Copyright (C) 2011 The Android Open Source Project
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

# Default values, possibly overridden by BoardConfigVendor.mk
TARGET_BOARD_INFO_FILE := device/samsung/toroplus/board-info.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/toroplus/bluetooth

# Use the non-open-source part, if present
-include vendor/samsung/toroplus/BoardConfigVendor.mk

# Use the part that is common between all tunas
include device/samsung/tuna/BoardConfig.mk

BOARD_USERDATAIMAGE_PARTITION_SIZE := 30691799040

# Use/add toroplus-specific variants
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_toroplus
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/toroplus

# on toroplus boards we need to apply a special adaptive filter
# on the compass output because of noise generated by the pmic.
BOARD_INVENSENSE_APPLY_COMPASS_NOISE_FILTER := true

# on newer versions of Android, libsec-ril_lte.so doesn't work
# unless special concessions are made in frameworks_native
# due to a pointer to an old symbol in surfacecomposerclient
# see commit 3f700f583d8edc0639c291f814716250eefcb5e2

TARGET_TOROPLUS_RADIO := true
