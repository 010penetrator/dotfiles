# eval `ssh-agent`
# ssh-add ~/.ssh/ss.k &

[[ -z $NDAYS ]] && NDAYS=20 # (re-) establish .torrents under that age

[[ -d /ln/torrents/red ]] || exit

# rsync -e ssh -avK --bwlimit=300K --progress --stats --no-perms --no-times --delete --size-only /ln/torrents/red/ admin@192.168.1.160:/ln/red/
rsync -e ssh -avK --progress --stats --no-perms --no-times --delete --size-only /ln/torrents/red/ pi@192.168.1.78:/ln/red/

cd /ln/ho/.rtorrent/watch/red/ || exit
for f in *.torrent
do
    # for torrents not older than NDAYS
    if [[ $(find "$f" -mtime -"$NDAYS" -print) ]] ; then
        # echo $(date -r "$f" "+%Y-%m-%d")
        echo $(date -r "$f" "+%Y-%m-%d") "  " $f
        echo "$f"
        transmission-remote 192.168.1.78:9090 -a -w /ln/red/ "$f"
    fi
done
cd -

