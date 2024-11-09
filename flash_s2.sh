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
    0x1000 s2_fw_update/build/bootloader/bootloader.bin \
    0xF000 s2_fw_update/build/partition_table/partition-table.bin \
    0x10000 BlueRetro/build/BlueRetro.bin \
    0x310000 s2_fw_update/build/s2_fw_update.bin \
    0x394000 s2_fw_update/build/ota_data_initial.bin
picocom -b 115200 /dev/ttyUSB1
