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

(cd vendor/samsung_spr/toro/proprietary/BIP.apk.parts ; zip -r ../BIP.unsigned.apk .)
java -jar $(find out/host -name signapk.jar) build/target/product/security/platform.x509.pem build/target/product/security/platform.pk8 vendor/samsung_spr/toro/proprietary/BIP.unsigned.apk vendor/samsung_spr/toro/proprietary/BIP.apk
(cd vendor/samsung_spr/toro/proprietary/IMSFramework.apk.parts ; zip -r ../IMSFramework.unsigned.apk .)
java -jar $(find out/host -name signapk.jar) build/target/product/security/platform.x509.pem build/target/product/security/platform.pk8 vendor/samsung_spr/toro/proprietary/IMSFramework.unsigned.apk vendor/samsung_spr/toro/proprietary/IMSFramework.apk
(cd vendor/samsung_spr/toro/proprietary/SDM.apk.parts ; zip -r ../SDM.unsigned.apk .)
java -jar $(find out/host -name signapk.jar) build/target/product/security/platform.x509.pem build/target/product/security/platform.pk8 vendor/samsung_spr/toro/proprietary/SDM.unsigned.apk vendor/samsung_spr/toro/proprietary/SDM.apk
(cd vendor/samsung_spr/toro/proprietary/SyncMLSvc.apk.parts ; zip -r ../SyncMLSvc.unsigned.apk .)
java -jar $(find out/host -name signapk.jar) build/target/product/security/platform.x509.pem build/target/product/security/platform.pk8 vendor/samsung_spr/toro/proprietary/SyncMLSvc.unsigned.apk vendor/samsung_spr/toro/proprietary/SyncMLSvc.apk
