#!/bin/bash

# Delete previous release
rm -fr release

# Delete build folders
rm -fr pico_fw_update/build
rm -fr s2_fw_update/build
rm -fr BlueRetro/build
rm -fr controller_hci_uart_esp32/build

# Delete sdkconfig
rm -f pico_fw_update/sdkconfig
rm -f s2_fw_update/sdkconfig
rm -f BlueRetro/sdkconfig
rm -f controller_hci_uart_esp32/sdkconfig

# Set config
cp BlueRetro/configs/usb/xbox BlueRetro/sdkconfig

# Build BRX FW
cd BlueRetro
idf.py build
cd ..

# Build BT FW
cd controller_hci_uart_esp32
idf.py build
cd ..

# Build S2 bootloader & update FW
cd s2_fw_update
idf.py build
cd ..

# Build PICO bootloader & update FW
cd pico_fw_update
idf.py build
cd ..

mkdir release
cp BlueRetro/build/BlueRetro_secure.bin release/xbox_s2.bin
cp controller_hci_uart_esp32/build/controller_hci_uart.bin release/xbox_pico.bin

