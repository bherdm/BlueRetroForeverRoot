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
    0x1000 pico_fw_update/build/bootloader/bootloader.bin \
    0xF000 pico_fw_update/build/partition_table/partition-table.bin \
    0x20000 pico_fw_update/build/ota_data_initial.bin \
    0x80000 controller_hci_uart_esp32/build/controller_hci_uart.bin \
    0x500000 pico_fw_update/build/pico_fw_update.bin
