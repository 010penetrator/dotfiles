#!/bin/bash
# Resize all images in dir to half and compress to jpg with imagemagick

mkdir respic ; for f in *.*; do convert "$f" -resize $1%  -sampling-factor 4:2:0  -quality 95%  jpg:respic/"$f".jpg ; done

