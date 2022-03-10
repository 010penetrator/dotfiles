#!/bin/bash
# Mount block device with udevil and dmenu.

source $sh/dmenurc.sh

LSBLK="lsblk"
# NAME,FSTYPE,LABEL,FSUSE%,FSSIZE,MOUNTPOINT 
target=$( $LSBLK -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT | grep -e ".sd\|.nvme" | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" | cut -f 1 -d " " | tr -cd '[:alnum:]' )
echo $target
if [ ! -z "${target}" ] ; then
    udevil mount /dev/$target &> /tmp/vil1 
    notify-send "$(cat /tmp/vil1)"
    # udevil mount /dev/$target 2>&1
    # udevil mount /dev/$target
fi

