#!/bin/bash

date

# starter=$(date +%s)sec
# while true; do
#   printf "%s\r" $(TZ=UTC date --date now-$starter +%H:%M:%S)
#   sleep 0.2
# done

date0=`date +%s`; while true; do 
   echo -ne "$(date -u --date @$((`date +%s` - $date0)) +%H:%M:%S)\r";
   sleep 0.2
done
