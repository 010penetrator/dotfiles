#!/bin/bash

date
now=$(date +%s)sec
while true; do
  printf "%s\r" $(TZ=UTC date --date now-$now +%H:%M:%S)
  sleep 0.2
done

