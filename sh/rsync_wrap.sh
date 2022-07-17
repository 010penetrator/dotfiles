#!/bin/bash
# Handy wrapper for rsync mirroring

#dirin="/ln/mo/QU64/port"
#dirout="/ln/mo/CW-V88-QUAD/port"

dirin=$1
dirout=$2
RSYNC_OPTS="-rt --progress --delete --size-only"

echo -e "\n=============================================\nStarting sync script"
read -rs -n1 -p $'\nhit Anykey to dry-run, "S" or Esc to skip it\n' prompt
# [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]] &&

if ! [[ $prompt == "s" || $prompt == "S" || $prompt == $'\e' ]] ; then
  echo -e "\n========== dry-run"
  for dir in "$dirout"/*/ ; do
    dir=${dir%*/}
    dir=${dir##*/}
    final_in="$dirin/$dir"
    final_out="$dirout/$dir"
    if [ -d "$final_in"/ ] ; then
      echo "  >>" "$final_in" ">>" "$final_out" ;  # sleep 3;
      rsync -n $RSYNC_OPTS "$final_in"/ "$final_out"
    fi
  done
  echo -e "========== dry-run done"
fi

read -rs -n1 -p $'\nhit Enter or Space to sync, Anykey to exit\n' prompt

if [[ $prompt == "" || $prompt == " " ]] ; then
  echo -e "\n========== rsync"
  for dir in "$dirout"/*/ ; do
    dir=${dir%*/}
    dir=${dir##*/}
    final_in="$dirin/$dir"
    final_out="$dirout/$dir"
    #echo "$dirin"/"$dir"/ ; read noth
    if [ -d "$final_in"/ ] ; then
      echo "  >>" "$final_in" ">>" "$final_out" ;  # sleep 3;
      rsync -rt $RSYNC_OPTS "$final_in"/ "$final_out"
    fi
  done
  echo -e "========== rsync done"
else
  echo "got $prompt, will exit."
fi

sleep 1

