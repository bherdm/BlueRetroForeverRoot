#!/bin/bash
python \
    -m esptool \
    --chip esp32s2 \
    -b 460800 \
    --before default_reset \
    --after no_reset write_flash \
    --flash_mode dio \
    --flash_size keep \
    --flash_freq 80m \
    0x1000 bin_s2/bootloader.bin \
    0xF000 bin_s2/partition-table.bin \
    0x10000 bin_s2/BlueRetro.bin \
    0x310000 bin_s2/s2_fw_update.bin \
    0x394000 bin_s2/ota_data_initial.bin
picocom -b 115200 /dev/ttyUSB1
