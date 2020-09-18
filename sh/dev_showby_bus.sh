#!/bin/bash

for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev); do
    (
        syspath="${sysdevpath%/dev}"
        devname="$(udevadm info -q name -p $syspath)"
        [[ "$devname" == "bus/"* ]] && continue
        eval "$(udevadm info -q property --export -p $syspath)"
        [[ -z "$ID_SERIAL" ]] && continue
        echo "/dev/$devname - $ID_SERIAL" , ID "$ID_VENDOR_ID" 
        # lsusb | grep "$ID_VENDOR_ID"
    )
done

echo '------------------'
lsusb
echo '------------------'
sudo lsblk -f 
echo '------------------'
df -BMB

