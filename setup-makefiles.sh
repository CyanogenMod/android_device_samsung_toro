#!/bin/sh

# Copyright (C) 2012 The CyanogenMod Project
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

#--------------------------------------------------------------

DEVICE=toro
MANUFACTURER=samsung
OUTVENDOR=vendor
#--------------------------------------------------------------

#--------------------------------------------------------------
# SAMSUNG
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/$MANUFACTURER/$DEVICE
MAKEFILE=../../../$OUTDIR/device-vendor.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_STEM := toro/device-partial.mk

\$(call inherit-product-if-exists, vendor/broadcom/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/csr/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/imgtec/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/invensense/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/nxp/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/samsung/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/ti/\$(LOCAL_STEM))

PRODUCT_RESTRICT_VENDOR_FILES := owner
EOF

#--------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigVendor.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_STEM := toro/BoardConfigPartial.mk

-include vendor/broadcom/\$(LOCAL_STEM)
-include vendor/csr/\$(LOCAL_STEM)
-include vendor/imgtec/\$(LOCAL_STEM)
-include vendor/invensense/\$(LOCAL_STEM)
-include vendor/nxp/\$(LOCAL_STEM)
-include vendor/samsung/\$(LOCAL_STEM)
-include vendor/ti/\$(LOCAL_STEM)
EOF

#--------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#--------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# Samsung blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    BIP \\
    IMSFramework \\
    RTN \\
    SDM \\
    SPG \\
    SyncMLSvc \\
    fRom \\
    libsecril-client \\
    libsyncml_core \\
    libsyncml_port \\
    lib_gsd4t \\
    libims \\
    libims_jni \\
    libsec-ril_lte
EOF

#--------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := BIP
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := IMSFramework
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := RTN
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := SDM
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := SPG
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := SyncMLSvc
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := fRom
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := fRom
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/bin
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libsecril-client
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := libsecril-client.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libsyncml_core
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := libsyncml_core.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libsyncml_port
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := libsyncml_port.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := lib_gsd4t
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := lib_gsd4t.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libims
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := libims.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libims_jni
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := libims_jni.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libsec-ril_lte
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := libsec-ril_lte.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

endif
EOF

#--------------------------------------------------------------
#  BROADCOM
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/broadcom/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := bcm4330
LOCAL_MODULE_OWNER := broadcom
LOCAL_SRC_FILES := bcm4330.hcd
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .hcd
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/firmware
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# Broadcom blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    bcm4330
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#--------------------------------------------------------------
#  CSR
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/csr/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := gps.omap4
LOCAL_MODULE_OWNER := csr
LOCAL_SRC_FILES := gps.omap4.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib/hw
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := sirfgps
LOCAL_MODULE_OWNER := csr
LOCAL_SRC_FILES := sirfgps.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/etc
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# CSR blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    sirfgps \\
    gps.omap4
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#--------------------------------------------------------------
#  IMGTEC
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/imgtec/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := pvrsrvctl
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := pvrsrvctl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/bin
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libEGL_POWERVR_SGX540_120
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libEGL_POWERVR_SGX540_120.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib/egl
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libGLESv1_CM_POWERVR_SGX540_120
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libGLESv1_CM_POWERVR_SGX540_120.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib/egl
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libGLESv2_POWERVR_SGX540_120
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libGLESv2_POWERVR_SGX540_120.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib/egl
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := gralloc.omap4
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := gralloc.omap4.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib/hw
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libglslcompiler
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libglslcompiler.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libIMGegl
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libIMGegl.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libpvr2d
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libpvr2d.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libpvrANDROID_WSEGL
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libpvrANDROID_WSEGL.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libPVRScopeServices
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libPVRScopeServices.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libsrv_init
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libsrv_init.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libsrv_um
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libsrv_um.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libusc
LOCAL_MODULE_OWNER := imgtec
LOCAL_SRC_FILES := libusc.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# Imgtec blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    pvrsrvctl \\
    libEGL_POWERVR_SGX540_120 \\
    libGLESv1_CM_POWERVR_SGX540_120 \\
    libGLESv2_POWERVR_SGX540_120 \\
    gralloc.omap4 \\
    libglslcompiler \\
    libIMGegl \\
    libpvr2d \\
    libpvrANDROID_WSEGL \\
    libPVRScopeServices \\
    libsrv_init \\
    libsrv_um \\
    libusc
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#--------------------------------------------------------------
#  INVENSENSE
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/invensense/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := libinvensense_mpl
LOCAL_MODULE_OWNER := invensense
LOCAL_SRC_FILES := libinvensense_mpl.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/vendor/lib
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# Invensense blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    libinvensense_mpl
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#--------------------------------------------------------------
#  NXP
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/nxp/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := libpn544_fw
LOCAL_MODULE_OWNER := nxp
LOCAL_SRC_FILES := libpn544_fw.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/firmware
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# NXP blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    libpn544_fw
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#--------------------------------------------------------------
#  TI
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/ti/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
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

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),toro)

include \$(CLEAR_VARS)
LOCAL_MODULE := ducati-m3
LOCAL_MODULE_OWNER := ti
LOCAL_SRC_FILES := ducati-m3.bin
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/firmware
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
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

# TI blob(s) necessary for Toro hardware
PRODUCT_PACKAGES := \\
    ducati-m3
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
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
EOF


#-------------------------------------------------------------------------
# MOVE FILES TO RIGHT PLACE
#-------------------------------------------------------------------------

SAMSUNGDIR=../../../$OUTVENDOR/$MANUFACTURER/$DEVICE/proprietary

# BROADCOM
TARGET=../../../$OUTVENDOR/broadcom/$DEVICE/proprietary
mv $SAMSUNGDIR/bcm4330.hcd $TARGET

# CSR
TARGET=../../../$OUTVENDOR/csr/$DEVICE/proprietary
mv $SAMSUNGDIR/gps.omap4.so $TARGET
mv $SAMSUNGDIR/sirfgps.conf $TARGET

# IMGTEC
TARGET=../../../$OUTVENDOR/imgtec/$DEVICE/proprietary
mv $SAMSUNGDIR/pvrsrvctl $TARGET
mv $SAMSUNGDIR/libEGL_POWERVR_SGX540_120.so $TARGET
mv $SAMSUNGDIR/libGLESv1_CM_POWERVR_SGX540_120.so $TARGET
mv $SAMSUNGDIR/libGLESv2_POWERVR_SGX540_120.so $TARGET
mv $SAMSUNGDIR/gralloc.omap4.so $TARGET
mv $SAMSUNGDIR/libglslcompiler.so $TARGET
mv $SAMSUNGDIR/libIMGegl.so $TARGET
mv $SAMSUNGDIR/libpvr2d.so $TARGET
mv $SAMSUNGDIR/libpvrANDROID_WSEGL.so $TARGET
mv $SAMSUNGDIR/libPVRScopeServices.so $TARGET
mv $SAMSUNGDIR/libsrv_init.so $TARGET
mv $SAMSUNGDIR/libsrv_um.so $TARGET
mv $SAMSUNGDIR/libusc.so $TARGET

# INVENSENSE
TARGET=../../../$OUTVENDOR/invensense/$DEVICE/proprietary
mv $SAMSUNGDIR/libinvensense_mpl.so $TARGET

# NXP
TARGET=../../../$OUTVENDOR/nxp/$DEVICE/proprietary
mv $SAMSUNGDIR/libpn544_fw.so $TARGET

# TI
TARGET=../../../$OUTVENDOR/ti/$DEVICE/proprietary
mv $SAMSUNGDIR/ducati-m3.bin $TARGET
