#!/bin/bash

bak="$HOME/bak/"
bak2="/ln/bl/bak"
rdir="$PWD"
name=$( echo my_bak_`date +%Y-%m-%d`.tar.gz )
[ -f "$bak"/"$name" ] && rm "$bak"/"$name"

mkdir -p $bak
cd "/ln/ho/moment/dotfiles"
tar -czf "$bak"/"$name" \
  sh \
  -C / ln \
  -C $tt/../ tt

[ -d /ln/co/transmission-daemon ] && cd /ln/co/ && tar -czf "$bak"/trm.tar.gz transmission-daemon

[ -d "$bak2" ] &&
  cp -f "$bak"/"$name" "$bak2"/my_bak.tar.gz &&
  cp -f "$bak"/trm.tar.gz /ln/torrents/torrents-bak/

cd "$rdir"

