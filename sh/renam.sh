# Rename files to be accepted in NTFS

if [ -z $1 ];then echo Give target directory; exit 0; fi
find "$1" -depth | while read FILE; do 
    SUBS=`echo "$FILE" | tr -d ':|' | tr -d "\"" | tr '[{}]' '[()]'`
    if [ "$FILE" != "$SUBS" ]; then
        echo old "$FILE"
        echo new "$SUBS"
        #mv "$FILE" "$SUBS"
    fi
    done
exit 0

