#!/bin/bash

bak="$HOME/bak/"
bak2="/ln/bl/bak"
mkdir -p $bak
rdir="$PWD"

a=$( ls $bak | grep my_bak_ | tail -1 )
! [[ $a ]] && i=11 || i=$( echo ${a##my_bak_} | cut -d '_' -f1 )
shopt -s extglob ; i=${i##+(0)}
i=$(( i%30 ))
(( i++ ))
[ ${#i} -lt 2 ] && i=0$i

name=$( echo my_bak_"$i"_`date +%Y-%m-%d`.tar.gz )
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

