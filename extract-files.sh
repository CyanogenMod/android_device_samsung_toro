#!/bin/bash

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

DEVICE=toro
MANUFACTURER=samsung

BASE=../../../vendor/$MANUFACTURER/$DEVICE/proprietary
mkdir -p $BASE
for FILE in $(grep -v "^#" proprietary-blobs.txt) ; do
    echo Pulling $FILE to $BASE
    adb pull $FILE $BASE
    if [ $FILE == "/system/bin/fRom" ] ; then
        echo chmod 755 $BASE/fRom
        chmod 755 $BASE/fRom
    fi
done

./setup-makefiles.sh
