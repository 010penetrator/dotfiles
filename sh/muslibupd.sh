#!/bin/bash
# Save list of music albums in my music folders. Show brief report.
muslibrary=$HOME/.mus-library

find /ln/mus/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u > $muslibrary
a=$(wc -l $muslibrary | cut -d " " -f1)
find /ln/__/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
find /ln/torrents/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
find /ln/mo/fast/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
b=$(wc -l $muslibrary | cut -d " " -f1)

# ( echo .:. MUSIC FAMILIARITY .:. $a of $b $'\n'; cat $muslibrary ) | dmenu $DMENU_OPTIONS -fn "$DMENU_FN"
echo .:. MUSIC FAMILIARITY .:. $a of $b
noti echo MUSIC FAMILIARITY .:. $a / $b

