# exit
bak="$HOME/.del/"
mkdir -p $bak
rdir="$PWD"
a=$(ls -lt $bak | grep bak-conf | head -1 | grep -e --0..0--)
i=$(echo ${a##*--0} | cut -c 1-2)
! [[ $a ]] && i=11
#echo $a .$i
i=$((i%60))
((i++))
name=$( echo bak-conf-tt--0"$i"0--`date +%Y-%m-%d`.tar.gz )
repo="$HOME/dotfiles/"
cd "$repo"
tar -czf "$bak"/"$name" \
  config sh \
  -C / ln \
  -C /ln/ho tt
#ls -t "$bak"bak* | head -5
cp "$bak"/"$name" /ln/bl/bak/conf.tar.gz

# tar -czhf "$bak"/bak-txt-0"$i"0--`date +%Y-%m-%d`.tar.gz -C /ln/ho tt
cd "$rdir"

rsync  -rtq /ln/ho/.config/transmission-daemon/torrents/ /ln/ho/.del/torrents/ --progress #trmbak 

