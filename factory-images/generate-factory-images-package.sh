#!/bin/sh

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

rm -rf tmp
mkdir -p tmp/mysid-itl41d
unzip -d tmp signed-mysid-target_files-223971.zip RADIO/radio.img RADIO/radio-cdma.img RADIO/bootloader.img
cp signed-mysid-img-223971.zip tmp/mysid-itl41d/image-mysid-itl41d.zip
cp tmp/RADIO/bootloader.img tmp/mysid-itl41d/bootloader-toro-primekj10.img
cp tmp/RADIO/radio-cdma.img tmp/mysid-itl41d/radio-cdma-toro-i515.ek01.img
cp tmp/RADIO/radio.img tmp/mysid-itl41d/radio-toro-i515.ek02.img
cp flash-all.sh tmp/mysid-itl41d
(cd tmp ; tar zcvf ../mysid-itl41d-factory.tgz mysid-itl41d)
mv mysid-itl41d-factory.tgz mysid-itl41d-factory-$(sha1sum < mysid-itl41d-factory.tgz | cut -b -8).tgz
rm -rf tmp
