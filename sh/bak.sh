#!/bin/bash
# Backup using tar

mkdir -p "$bakhot"
! [[ -d $bakhot ]] && echo Error! Hot backup dir not available! && exit

DAY=$(date +%Y-%m-%d)
MON=$(date +%Y-%m)
if [[ -d $bakhot/$DAY ]] ; then
    if [[ $DONTOVERWRITE == 1 ]] ; then
        echo -e "-- Backup not wanted!"
        exit
    else
        rm -rf "$bakhot/$DAY"
    fi
fi
mkdir "$bakhot/$DAY"

[[ -d $bakhot/ffbookmarks ]] &&
{
cd "$bakhot/ffbookmarks"
latest=$(ls . -t | head -1 )
boomname="$(echo $latest | cut  -f -2 -d '_').jsonlz4"
cp "$latest" "/tmp/$boomname"
cd -
}

echo --bak.stage1
tar -czf /ln/lo/cur/linkdir.tar.gz -C / ln

[[ -d $tt ]] && conditional_line="-C $tt/../ tt"
    tar -chzf "$bakhot/$DAY/words.tar.gz" --ignore-failed-read \
        -C /ln/ --exclude=lo/cur sh lo \
        -C /tmp $boomname \
        $conditional_line

[[ -d /ln/torrents ]] &&
    tar -czf "$bakhot/$DAY/torrents.tar.gz" --ignore-failed-read \
        -C $HOME .config/transmission-daemon .rtorrent .rtorrent.rc

# [[ -d /ln/co/joke ]] && conditional_line="-C /ln/co/ nvim/plugged"
[[ -d /ln/co/nvim ]] && [[ $space == "ho" ]] &&
    tar -cf "$bakhot/$DAY/plugged.tar.zst" -I "zstd -10 -T0" --exclude='.git' \
        -C /ln/co/nvim plugged

[[ -d /ln/wo ]] && [[ $space == "wo" ]] &&
    workrp=$(realpath /ln/wo) && workbn=$(basename $workrp) &&
    tar -cf "$bakhot/$DAY/work.tar.zst" -I "zstd -10 -T0" -C $workrp/.. $workbn

tar -cf "$bakhot/$DAY/conf.tar.zst" -I "zstd -10 -T0" --ignore-failed-read \
    -C / etc/fstab etc/udevil/udevil.conf \
    -C $HOME .ssh .bash_history $(ls .git*tials 2>/dev/null) .cache/dmenu-recent .vim \
    -C /ln/co kitty kitty-themes deadbeef \
    $conditional_line

[[ -d $bakcld ]] &&
    {
        echo --bak.stage2
        mkdir -p "$bakcld/${space}_$MON"
        cp -rf "$bakhot/$DAY/"*tar* "$bakcld/${space}_$MON"
    } ||
        { echo Warning! Cold backup dir failed! ;}

bakusbdir=$(compgen -G /ln/mo/*AMV/bak)
[[ -d $bakusbdir ]] &&
    {
        echo --Gonna write to SAM as well..
        mkdir -p "$bakusbdir/${space}_$MON"
        cp -rf "$bakhot/$DAY/"*tar* "$bakusbdir/${space}_$MON"
    }

