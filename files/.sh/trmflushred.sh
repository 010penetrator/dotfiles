eval `ssh-agent`
# ssh-add ~/.ssh/ss.k &

rsync -e ssh -avK --progress --stats --no-perms --no-times --delete --size-only /ln/torrents/red/ pi@192.168.1.78:/ln/red/

cd /ln/torrents/red/.torrents-new/
for f in *.torrent
do
  if [ -f "$f" ] ; then
    echo $f
    transmission-remote 192.168.1.78:9090 -a -w /ln/red/ "$f"
    mkdir -p del
    mv "$f" del/
  fi
done
cd -
