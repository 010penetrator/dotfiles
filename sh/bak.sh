#!/bin/bash

bak="$HOME/bak/"
mkdir -p $bak
bak2="/ln/bl/bak"
rdir="$PWD"
name="my_bak_$(date +%Y-%m-%d).tar.gz"
[ -f "$bak/$name" ] && rm "$bak/$name"

tar -czf /ln/lo/linkdir.tar.gz -C / ln
tar -chzf "$bak/$name" -C /ln/  sh lo \
                  -C $tt/../ tt

[ -d /ln/co/transmission-daemon ] &&
  tar -czf "$bak"/trm.tar.gz -C /ln/co/ transmission-daemon

[ -d "$bak2" ] &&
  cp -f "$bak/$name" "$bak2"/my_bak.tar.gz &&
  cp -f "$bak"/trm.tar.gz /ln/torrents/torrents-bak/

cd "$rdir"

