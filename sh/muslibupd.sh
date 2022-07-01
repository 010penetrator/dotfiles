#!/bin/bash
# Save list of music albums in my music folders. Show brief report.
muslibrary=$HOME/.mus-library
rm $muslibrary

PATH_OLD="/ln/mus"
PATH_NEW="/ln/__/ /ln/torrents/ /ln/mo/fast/"

find $(realpath $PATH_OLD) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u > $muslibrary
c1=$(wc -l $muslibrary | cut -d " " -f1)
find $(realpath $PATH_NEW) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
c2=$(wc -l $muslibrary | cut -d " " -f1)

# find /ln/__/       -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
# find /ln/torrents/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
# find /ln/mo/fast/  -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary

noti echo .:. MUSIC FAMILIARITY .:. $c1 of $c2
echo .:. MUSIC FAMILIARITY .:. $c1 of $c2

