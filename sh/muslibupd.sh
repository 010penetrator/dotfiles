#!/bin/bash
# Save list of music albums in my music folders. Show brief report.
muslibrary=$HOME/.mus-library
rm $muslibrary

PATH_OLD="/ln/mus"
PATH_NEW="/ln/torrents/ /ln/mo/blink/torrents_ready/musREPAIR/ /ln/dwn"

find -L $(realpath $PATH_OLD) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u > $muslibrary
cnt1=$(wc -l $muslibrary | cut -d " " -f1)

find -L $(realpath $PATH_NEW) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> $muslibrary
cnt2=$(wc -l $muslibrary | cut -d " " -f1)

HASG=false; pgrep -c Xorg &>/dev/null && HASG=true

[ HASG==true ] && noti echo .:. MUSIC FAMILIARITY .:. $cnt1 of $cnt2
echo .:. MUSIC FAMILIARITY .:. $cnt1 of $cnt2

