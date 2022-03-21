#!/bin/bash
# Распаковать архив не указывая тип распаковщика

if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Использование: upk <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
else
    if [ -f "$1" ] ; then
        NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)      tar xvjf "$1"    ;;
          *.tar.gz)       tar xvzf "$1"    ;;
          *.tar.xz)       tar xvJf "$1"    ;;
          *.tar.zst)      tar -I zstd -xvf "$1" ;;
          *.lzma)         unlzma "$1"      ;;
          *.bz2)          bunzip2 "$1"     ;;
          *.rar|*.RAR)    unrar x -ad "$1" ;;
          *.gz)           gunzip "$1"      ;;
          *.tar)          tar xvf "$1"     ;;
          *.tbz2)         tar xvjf "$1"    ;;
          *.tgz)          tar xvzf "$1"    ;;
          *.zip|*.ZIP)    unzip "$1"       ;;
          *.Z)            uncompress "$1"  ;;
          *.7z|*.7Z)      7z x "$1"        ;;
          *.xz)           unxz -k "$1"     ;;
          *.exe)          cabextract "$1"  ;;
          *)              echo "upk: '$1' - Не может быть распакован" ; exit 1 ;;
        esac
    else
        echo "'$1' - не является допустимым файлом"
    fi
fi

