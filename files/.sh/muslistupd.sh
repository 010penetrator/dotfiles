. $sh/dmenurc.sh
find -L /ln/mus/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u > .mus-list
a=$(wc -l .mus-list | cut -d " " -f1)
find -L /ln/____/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> .mus-list
find -L /ln/torrents/ -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf '%h\n' | sort -u >> .mus-list
b=$(wc -l .mus-list | cut -d " " -f1)
# (echo .:. MUSIC FAMILIARITY .:. $a of $b $'\n'; cat .mus-list) | dmenu $DMENU_OPTIONS
echo .:. MUSIC FAMILIARITY .:. $a of $b
noti echo MUSIC FAMILIARITY .:. $a / $b

