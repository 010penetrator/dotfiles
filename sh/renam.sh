#!/bin/bash
# Rename files to conform NTFS charset

if [[ -z $1 ]]; then
    echo Give target directory
    exit
fi

find "$1" -depth | while read FILE; do
        SUBS=$( echo "$FILE" | tr ':|' '_' | tr -d '\"' | tr '\*' '_' | tr '{}?' '()_' )
        if [[ "$FILE" != "$SUBS" ]]; then
            echo old "$FILE"
            echo new "$SUBS"
            [[ WETRUN -eq 1 ]] && mv "$FILE" "$SUBS"
        fi
    done

