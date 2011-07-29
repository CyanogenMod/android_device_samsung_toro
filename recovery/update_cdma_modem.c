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

#include <errno.h>
#include <fcntl.h>
#include <linux/usbdevice_fs.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>
#include <termios.h>

#include "update_cdma_modem.h"


#define MODEM_DEVNODE "/dev/cdma_boot0"

#define IOCTL_MODEM_ON          _IO('o', 0x19)
#define IOCTL_MODEM_OFF         _IO('o', 0x20)
#define IOCTL_MODEM_RESET       _IO('o', 0x21)
#define IOCTL_MODEM_BOOT_ON     _IO('o', 0x22)
#define IOCTL_MODEM_BOOT_OFF    _IO('o', 0x23)
#define IOCTL_MODEM_START       _IO('o', 0x24)
#define IOCTL_MODEM_SEND        _IO('o', 0x25)
#define IOCTL_MODEM_RECV        _IO('o', 0x26)
#define IOCTL_MODEM_STATUS      _IO('o', 0x27)
#define IOCTL_MODEM_GOTA_START  _IO('o', 0x28)
#define IOCTL_MODEM_FW_UPDATE   _IO('o', 0x29)

/* buffer type for modem image */
struct dpram_firmware {
  char *firmware;
  int size;
  int is_delta;
};

static int modem_download_ioctl_fw(int sel, struct dpram_firmware* fw)
{
  int fd = open(MODEM_DEVNODE, O_RDWR);
  if (fd < 0) {
    fprintf(stderr, "Unable to open modem device (%s)\n", strerror(errno));
    return -1;
  }
  int ret = (fw != NULL) ? ioctl(fd, sel, fw) : ioctl(fd, sel);
  close(fd);

  return ret;
}

static int modem_download_ioctl(int sel)
{
  return modem_download_ioctl_fw(sel, NULL);
}

int update_cdma_modem(const char* image_data, size_t image_size) {
  int ret;
  struct dpram_firmware fw;

  ret = modem_download_ioctl(IOCTL_MODEM_GOTA_START);
  if (ret < 0) {
    fprintf(stderr, "IOCTL_MODEM_GOTA_START failed: (%d)\n", ret);
    return -1;
  }

  ret = modem_download_ioctl(IOCTL_MODEM_BOOT_ON);
  if (ret < 0) {
    fprintf(stderr, "IOCTL_MODEM_BOOT_ON failed: (%d)\n", ret);
    return -1;
  }

  fw.firmware = image_data;
  fw.size = image_size;
  fw.is_delta = 0;

  ret = modem_download_ioctl_fw(IOCTL_MODEM_FW_UPDATE, &fw);
  if (ret < 0) {
    fprintf(stderr, "IOCTL_MODEM_FW_UPDATE failed: (%d)\n", ret);
    return -1;
  }

  ret = modem_download_ioctl(IOCTL_MODEM_BOOT_OFF);
  if (ret < 0) {
    fprintf(stderr, "IOCTL_MODEM_BOOT_OFF failed: (%d)\n", ret);
    return -1;
  }

  printf("Firmware update was successful\n");

  return 0;
}
