#!/bin/bash
# Save list of music albums in my music folders. Show brief report.

muslibrary=$HOME/.mus-library
rm $muslibrary

PATH_NEW="/ln/torrents /ln/mo/blink/torrents_ready/musREPAIR /ln/dwn /ln/mus/0*"
PATH_MOST="/ln/mus/*"

find -L $(realpath $PATH_NEW) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u > $muslibrary
cnt1=$(wc -l $muslibrary | cut -d " " -f1)

find -L $(realpath $PATH_NEW $PATH_MOST | sort | uniq) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u > $muslibrary
cnt2=$(wc -l $muslibrary | cut -d " " -f1)

HASG=false; pgrep -c Xorg &>/dev/null && HASG=true

[ HASG==true ] && noti echo .:. NEW MUSIC .:. $cnt1 of $cnt2
echo .:. NEW MUSIC .:. $cnt1 of $cnt2

