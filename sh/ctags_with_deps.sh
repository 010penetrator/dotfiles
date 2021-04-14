#!/bin/sh

TMPFILE=/tmp/ctagsourcelist
touch $TMPFILE

gcc -M $* 2>/dev/null | sed -e 's/[\\ ]/\n/g' | \
    sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
    tee $TMPFILE | sort -u | \
    ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
[ $? -eq 0 ] && echo Ctags done! || echo Ctags ERROR!


