/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <errno.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

#include "edify/expr.h"
#include "update_cdma_modem.h"

Value* UpdateCdmaModemFn(const char* name, State* state, int argc, Expr* argv[])
{
    int result = -1;
    Value* img;

    if (argc != 1) {
        return ErrorAbort(state, "%s() expects 1 arg, got %d", name, argc);
    }

    if (ReadValueArgs(state, argv, 1, &img) < 0) {
        return NULL;
    }

    if(img->type != VAL_BLOB) {
      FreeValue(img);
      return ErrorAbort(state, "%s(): argument types are incorrect", name);
    }

    result = update_cdma_modem(img->data, img->size);
    FreeValue(img);
    return StringValue(strdup(result == 0 ? "t" : ""));
}

void Register_librecovery_updater_toro() {
    fprintf(stderr, "installing samsung updater extensions for toro\n");

    RegisterFunction("samsung.update_cdma_modem", UpdateCdmaModemFn);
}
