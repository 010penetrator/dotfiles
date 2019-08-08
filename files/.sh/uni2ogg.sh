f=$(ls | grep -c '\.flac$');
c=$(ls | grep -c '\.cue$');
if [ $c -eq 0 ] || [ $f -gt $c ];
	then flac2ogg.sh . /ln/mo/blink/MUZIK/;
	else cue2ogg.sh . /ln/mo/blink/MUZIK/;
fi

