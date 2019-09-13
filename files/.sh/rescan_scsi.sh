#! /bin/bash

SCSI=/sys/class/scsi_host
test ! -d "$SCSI" && echo "Error: cannot find $SCSI directory." && exit 1
cd "$SCSI" || exit 1

for i in *; do
        echo -n "Scanning $i ..."
        echo "- - -" > $i/scan && echo " done."
done

echo "Finished. Consult with 'dmesg' for details."

