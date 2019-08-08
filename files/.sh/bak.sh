# exit
bak="$HOME/.del/"
rdir="$PWD"
a=$(ls -lt $bak | grep bak-conf | head -1 | grep -e --0..0--)
i=$(echo ${a##*--0} | cut -c 1-2)
! [[ $a ]] && i=11
#echo $a .$i
i=$((i%60))
((i++))
name=$( echo bak-conf--0"$i"0--`date +%Y-%m-%d`.tar.gz )
repo="$HOME/dotfiles/files"
cd "$repo"
tar -czf "$bak"/"$name" \
  .config .sh \
  -C / ln
#ls -t "$bak"bak* | head -5
cp "$bak"/"$name" /ln/hh/tt/bak.conf.tar.gz
# cp "$HOME"/.config/chromium/Default/Bookmarks /ln/hh/tt/uniq/
tar -czhf "$bak"/bak-txt-0"$i"0--`date +%Y-%m-%d`.tar.gz -C /ln/hh tt
cd "$rdir"

