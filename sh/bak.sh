#!/bin/bash
# Backup using tar

mkdir -p "$bakhot"
! [[ -d $bakhot ]] && echo Error! Hot backup dir not available! && exit

DAY=$(date +%Y-%m-%d)
WEEK=$(date +%Y_w%W)
MON=$(date +%Y-%m)
DEST_HOT="$bakhot/$WEEK"

if [[ -d $DEST_HOT ]] ; then
    if [[ $DONTOVERWRITE == 1 ]] ; then
        echo -e "-- Backup not wanted!"
        exit
    else
        rm -rf "$DEST_HOT"
    fi
fi
mkdir "$DEST_HOT"

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
[[ -n $boomname ]] && conditional_line="$conditional_line -C /tmp $boomname"
    tar -chzf "$DEST_HOT/words.tar.gz" --ignore-failed-read \
        -C /ln/ --exclude=lo/cur sh lo \
        $conditional_line

[[ -d /ln/torrents ]] &&
    tar -czf "$DEST_HOT/torrents.tar.gz" --ignore-failed-read \
        -C $HOME .config/transmission-daemon .rtorrent .rtorrent.rc

# [[ -d /ln/co/joke ]] && conditional_line="-C /ln/co/ nvim/plugged"
[[ -d /ln/co/nvim ]] && [[ $space == "ho" ]] &&
    tar -cf "$DEST_HOT/plugged.tar.zst" -I "zstd -10 -T0" --exclude='.git' \
        -C $git plugged

[[ -d /ln/wo ]] && [[ $space == "wo" ]] &&
    workrp=$(realpath /ln/wo) && workbn=$(basename $workrp) &&
    tar -cf "$DEST_HOT/work.tar.zst" -I "zstd -10 -T0" -C $workrp/.. $workbn

tar -cf "$DEST_HOT/conf.tar.zst" -I "zstd -10 -T0" --ignore-failed-read \
    -C / etc/fstab etc/udevil/udevil.conf \
    -C $HOME .ssh .bash_history $(ls .git*tials 2>/dev/null) .cache/dmenu-recent .vim \
    -C /ln/co kitty kitty-themes deadbeef \
    $conditional_line

[[ -d $bakcld ]] &&
    {
        echo --bak.stage2
        mkdir -p "$bakcld/${space}_$MON"
        cp -rf "$DEST_HOT/"*tar* "$bakcld/${space}_$MON"
    } ||
        { echo Warning! Cold backup dir failed! ;}

bakusbdir=$(compgen -G /ln/mo/*AMV/bak)
[[ -d $bakusbdir ]] &&
    {
        devlabel=$(echo $bakusbdir | tr / \\n | grep AMV)
        echo --Gonna write to $devlabel as well..
        mkdir -p "$bakusbdir/${space}_$MON"
        cp -rf "$DEST_HOT/"*tar* "$bakusbdir/${space}_$MON"
    }

