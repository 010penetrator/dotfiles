#!/bin/bash

# for dir in /home/plasmik/*/; 
# do     dir=${dir%*/};     echo ${dir##*/}; done

#dirin="/ln/mo/QU64/port"
#dirout="/ln/mo/CW-V88-QUAD/port"

dirin=$1
dirout=$2

read -p "Do dry run first? (y/n)" prompt
[[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]] &&

for dir in "$dirout"/*/ ; do
	dir=${dir%*/}
	dir=${dir##*/}
	#echo "$dirin"/"$dir"/ ; read noth
	if [ -d "$dirin"/"$dir"/ ] ; then echo "$dirin"/"$dir"/ ;  # sleep 3;
		rsync -rtn --delete --progress "$dirin"/"$dir"/ "$dirout"/"$dir"
	fi
done

read -p "Press ENTER to sync or Ctrl-C to exit" prompt

for dir in "$dirout"/*/ ; do
	dir=${dir%*/}
	dir=${dir##*/}
	#echo "$dirin"/"$dir"/ ; read noth
	if [ -d "$dirin"/"$dir"/ ] ; then
		rsync -rt --delete --progress "$dirin"/"$dir"/ "$dirout"/"$dir"
	fi
done


