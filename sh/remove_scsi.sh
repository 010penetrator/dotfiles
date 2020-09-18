#! /bin/bash
#----------------------------------------------------------------------
# Description: a simple script to remove SCSI devices using sysfs
# Author: Artem S. Tashkinov <no-mail@no-mail.com>
# Created at: Mon Apr  4 04:24:09 YEKST 2011
# Computer: localhost.localdomain
# System: Linux 2.6.38.2-ic on i686
#
# Copyright (c) 2011 Artem S. Tashkinov  All rights reserved.
#
#----------------------------------------------------------------------

DEVLIST=/sys/class/scsi_device/*/device
echo "We have found the following hot-pluggable SCSI devices:"

i=0
for item in $DEVLIST; do
        if [ -f "$item/delete" ]; then
                i=$((i+1))
                d_sys[$i]="$item"
                d_blk[$i]=`ls "$item"/block 2>/dev/null`
                d_dsc[$i]=`cat "$item"/{vendor,model,rev} 2>/dev/null | tr -d '\n'`
                echo " $i: ${d_dsc[$i]} ${d_blk[$i]}"
        fi
done

echo -n "Please, enter a device number to remove or 0 to exit: "
read devn

if ! [ "$devn" -eq "$devn" 2> /dev/null ]; then
        echo "Error: [$devn] isn't a number, bye."
        exit 2
fi

if [ "$devn" -lt 1 -o "$devn" -gt $i -o "$devn" -eq 0 ]; then
        echo "No action taken, bye."
        exit
fi

sync # Just in case

for i in ${d_blk[$devn]}; do
        curdev="/dev/$i"
        alldev="$alldev $curdev `find /dev -maxdepth 1 -lname $i 2>/dev/null`"
        echo -n "Flushing  $curdev ... "
        blockdev -v --flushbufs $curdev
done

for i in $alldev; do
        grep -q $i /proc/mounts && echo "$i is still mounted! You are insane!" && exit 0
done

echo 1 > "${d_sys[$devn]}"/delete
sleep 2 # Give time to flush device buffers
test -d ${d_sys[$devn]} && echo "${d_dsc[$devn]} was NOT removed." || echo "You can safely remove ${d_dsc[$devn]}"

