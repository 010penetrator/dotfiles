#!/bin/bash
# Log sha1 hashsum for every files in current location

echo Writing to $curpat
curpat=$(echo $PWD | tr -d "/"  )
export output=/tmp/scrub_"$curpat"
rm $output

find * -type f -exec bash -c 'sum=$(sha1sum "{}" |cut -f1 -d " " ); echo -e "file:{}\nsha1:$sum" >>/tmp/"$output" ' \;
cat "$output"

