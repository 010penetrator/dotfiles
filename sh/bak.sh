#!/bin/bash
# Backup using tar

mkdir -p "$bakhot"
! [[ -d $bakhot ]] && echo Error! Hot backup dir not available! && exit
echo stage1

DAY="$(date +%Y-%m-%d)"
[[ -d $bakhot/$DAY ]] && rm -rf "$bakhot/$DAY"
mkdir "$bakhot/$DAY"

tar -czf /ln/lo/cur/linkdir.tar.gz -C / ln
tar -chzf "$bakhot/$DAY/words.tar.gz" \
        -C /ln/ --exclude=lo/cur sh lo \
        -C $tt/../ tt
tar -czf "$bakhot/$DAY/torrents.tar.gz" --ignore-failed-read \
        -C /ln/ho .config/transmission-daemon .rtorrent
tar -czf "$bakhot/$DAY/conf.tar.gz" --ignore-failed-read \
        -C / etc/fstab etc/udevil/udevil.conf ln/ho/.ssh ln/ho/.vim ln/co/nvim

! [[ -d $bakcld ]] && echo Warning! Cold backup dir not available! && exit
echo stage2

cp -rf "$bakhot/$DAY" "$bakcld/"

