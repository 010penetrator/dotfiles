#!/bin/bash
# Rename files to conform NTFS charset
# Also rename crazy chars like "$"

if [[ -z $1 ]]; then
    echo Usage: [WETRUN=1] renam.sh target/dir
    exit
fi

# Just non-NTFS set would be like this...
# find "$1" \( -name "*[:|\"\*{}?]*" \) |

# Avoid more crazy chars
find "$1" \( -name "*[\`:|\$\"\*?]*" -or -name "*\n\n\n*" \) |
    while read NUTSNAME;
    do
        NEWNAME=$( echo "$NUTSNAME" | tr "\`" "'" | tr ':|@\$' '_' | tr -d '\"' | tr '\*' '_' | tr '{}?' '()_' )
        echo old "$NUTSNAME"
        echo new "$NEWNAME"
        [[ WETRUN -eq 1 ]] && mv -i "$NUTSNAME" "$NEWNAME"
    done

