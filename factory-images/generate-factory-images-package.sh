#!/bin/sh

# Copyright 2011 The Android Open Source Project
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

# 223971 = ITL41D
# 235179 = ICL53F
# 299849 = IMM76D
# 336647 = IMM76K
# 397360 = JRO02C
# 398337 = JRO03C
# 424425 = JRO03O
# 573038 = JDQ39
# 683083 = JWR51
# 689345 = JWR58
# 690834 = JWR59
# 704243 = JWR66G
# 711294 = JWR66N
# 737497 = JWR66V

source ../../../common/clear-factory-images-variables.sh
PRODUCT=mysid
DEVICE=toro
BUILD=737497
VERSION=jwr66v
SRCPREFIX=signed-
BOOTLOADER=primemd04
RADIO=i515.fk02
CDMARADIO=i515.fk01
source ../../../common/generate-factory-images-common.sh
