#!/bin/bash
# Use it to hot-plug HDD

SCSI=/sys/class/scsi_host
test ! -d "$SCSI" && echo "Error: cannot find $SCSI directory." && exit 1
cd "$SCSI" || exit 1

for i in *; do
        echo -n "Scanning $i ..."
        echo "- - -" > $i/rescan && echo " done."
        # echo "- - -" > $i/scan && echo " done."
done

echo "Finished. Consult with 'dmesg' for details."

