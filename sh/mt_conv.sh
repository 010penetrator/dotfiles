#!/bin/bash
# Convert music files. Multithreaded to N threads!

[ -z $Nthr ] && Nthr=8
TMPF=tmpfifo
DEST=/ln/fast/enc

COMM="conv_any2ogg.sh"

rm $TMPF &>/dev/null
mkfifo $TMPF # creating named pipe

rm -rf "$DEST"/*
time (
counter=0
progres=0

cat /ln/ho/.mus-favourites | while read podgon; do
let $[progres++];
notify-send "prog is $progres \\ $counter"
if [ $counter -lt $Nthr ]; then # we are under the limit
    { $COMM "$podgon" "$DEST"; echo 'done' > $TMPF; } &
    let $[counter++];
else
    read x < $TMPF # waiting for a process to finish
    { $COMM "$podgon" "$DEST"; echo 'done' > $TMPF; } &
fi
done
# i=i%${Nthr}; ((i++==0)) && wait -n

cat $TMPF > /dev/null # let all the background processes end
rm $TMPF # remove fifo
)

