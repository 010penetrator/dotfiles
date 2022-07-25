#!/bin/bash
# Umount block device with udevil and dmenu.

[[ -z $SELECTOR ]] && SELECTOR="dmenu" && source $sh/dmenurc && SELECTOR="dmenuy"

LSBLK="lsblk"
target=$( $LSBLK -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT -l | grep '/' |
    $SELECTOR | cut -f 1 -d " " )

if [[ ! -z $target ]]; then # target is null or ''
    mopoint=$(findmnt /dev/${target} -o TARGET -n)
    # sync "/dev/$target"
    sync -f "$mopoint"
    if [ $? -eq "0" ]; then
        udevil umount /dev/$target 2>&1 | tee /tmp/vil-umo
        if [ ${PIPESTATUS[0]} -eq "0" ]; then
            echo "/dev/$target unmounted from $mopoint"
            notify-send "/dev/$target unmounted from $mopoint"
            # notify-send "$(cat /tmp/vil-umo)"
        fi
    else
        notify-send "$(cat /tmp/vil-umo)"
        notify-send "Not able to sync /dev/$target"
    fi
else
    echo "No target!"
fi

