#!/bin/bash
# Convert music folder to ogg format

f=$(ls | grep -c '\.flac$');
c=$(ls | grep -c '\.cue$');
if [ $c -eq 0 ] || [ $f -gt $c ];
	then conv_flac2ogg.sh . /ln/mo/blink/MUZIK/;
	else conv_cue2ogg.sh . /ln/mo/blink/MUZIK/;
fi

