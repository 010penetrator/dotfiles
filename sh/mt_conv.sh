#!/bin/bash
# Convert music files. Multithreaded to N threads!

[ -z $Nthr ] && Nthr=8
TMPF=tmpff

mkfifo $TMPF # creating named pipe

rm -rf /ln/fast/enc/*
time (
counter=0
progres=0

cat /ln/ho/.mus-favourites | while read f; do
let $[progres++];
# notify-send "prog is $progres $counter"
if [ $counter -lt $Nthr ]; then # we are under the limit
    {
        conv_any2ogg.sh "$f" /ln/fast/enc;
        echo 'done' > $TMPF;
    } &
    let $[counter++];
else
    read x < $TMPF # waiting for a process to finish
    {
        conv_any2ogg.sh "$f" /ln/fast/enc;
        echo 'done' > $TMPF;
    } &
fi
done
# i=i%${Nthr}; ((i++==0)) && wait -n

cat $TMPF > /dev/null # let all the background processes end
rm $TMPF # remove fifo
)

