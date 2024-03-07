#!/bin/bash
# Log sha1 hashsum for every file in current location

dst=$(echo "$PWD$1" | tr -d "/ "  )
export output=/tmp/scrub_"$dst"

echo Output_ $output
[[ -f "$output" ]] &&
    rm "$output"

find -L  "$1"  -depth  -type f -not -path '*/\.git/*'  -print 1>"$output"

# find .  -depth  -type f -not -path '*/\.git/*' -exec bash -c '
#     fname="{}";
#     sum=$(sha1sum "$fname" |cut -f1 -d " " );
#     echo -e "$fname:$sum" >>"$output"
#     ' \;
# sha1sum "{}" >> "$output"

sort -o "$output" "$output"
du -h "$output"

echo "Gonna calc sha1 sums.."
cat "$output" | while read fname
do
    sum=$(sha1sum "$fname"| cut -f1 -d " ")
    echo -e "$fname:$sum" >>"$output"_sums
done

mv "$output"_sums "$output"
du -h "$output"

