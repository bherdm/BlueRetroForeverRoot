#!/bin/bash
python \
    -m esptool \
    --chip esp32 \
    -b 460800 \
    --before default_reset \
    --after hard_reset write_flash \
    --flash_mode dio \
    --flash_size 8MB \
    --flash_freq 80m \
    0x1000 bin_pico/bootloader.bin \
    0xF000 bin_pico/partition-table.bin \
    0x20000 bin_pico/ota_data_initial.bin \
    0x80000 bin_pico/controller_hci_uart.bin \
    0x500000 bin_pico/pico_fw_update.bin
