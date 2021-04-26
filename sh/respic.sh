#!/bin/bash
# Resize all images in dir to half and compress to jpg with imagemagick

[ -z "$1" ] && set -- "50%"

mkdir -p respic
for f in *.png ; do
    convert "$f" -resize "$1" -sampling-factor 4:2:0  -quality 95%  jpg:respic/"$f".jpg;
done
for f in *.jpg ; do
    convert "$f" -resize "$1" -sampling-factor 4:2:0  -quality 95%  jpg:respic/"$f";
done

