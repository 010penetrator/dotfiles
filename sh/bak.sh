#!/bin/bash
# Backup using tar

bak1="$HOME/bak/"
mkdir -p $bak1
bak2="/ln/bl/bak"
begin_dir="$PWD"
name="my_bak_$(date +%Y-%m-%d).tar.gz"
[ -f "$bak1/$name" ] && rm "$bak1/$name"

tar -czf /ln/lo/linkdir.tar.gz -C / ln
tar -chzf "$bak1/$name" -C /ln/  sh lo \
                  -C $tt/../ tt

[ -d /ln/co/transmission-daemon ] &&
  tar -czf "$bak1"/trm.tar.gz -C /ln/co/ transmission-daemon

[ -d "$bak2" ] &&
  cp -f "$bak1/$name" "$bak2"/my_bak.tar.gz &&
  cp -f "$bak1"/trm.tar.gz /ln/torrents/torrents-bak/

cd "$begin_dir"

