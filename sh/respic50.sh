# Make half-size decent jpg with imagemagick
mkdir res50 ; for f in *.*; do convert "$f" -resize 50%  -sampling-factor 4:2:0  -quality 95%  jpg:res50/"$f" ; done

