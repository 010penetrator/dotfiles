#!/bin/bash
# Уничтожить комменты внутри фигурных скобок

list=$(find * -type f \( -name "*.c" \) -printf '%p ' )
echo -e "--list is \n$list\n"

# Создать файл с функцией для Вима
cat << 'EOF' > /tmp/exterm.vim
function! Extercomms()
    exec 0
    while ( 1 )
        " Найдем местоположение пары фигурных скобок
        let beg = search('{','W')
        if ( beg == 0 ) | echo "Breaking" | break | endif
        exec beg | exec "normal 0f{" | exec "normal %" | let fin = line('.')
        echo beg fin
        "   ^  //comment
        silent! exec beg . "," . fin . "s/^\\s*\\/\\/.*\\n/FFdeletelaterFF/"
        "   [code] //comment
        silent! exec beg . "," . fin . "s/\\s*\\/\\/.*/"
        "   ^  /*comment*/
        silent! exec beg . "," . fin . "s/^\\s*\\/\\*.*\\*\\/\\n/FFdeletelaterFF/"
        "   /*inline comment*/    [/*maybe more inline comment*/]
            " %s/\s*\/\*.\{-}\*\//mmmmmmm/g
        silent! exec beg . "," . fin . "s/\\s*\\/\\*.\\{-}\\*\\// IIdeleteinlineII/g"
        "   [code] /* multiline <CR> comment */
            " %s/\s*\/\*\(.*\n\)\{-}.*\*\/\n/
        silent! exec beg . "," . fin . "s/\\s*\\/\\*\\(.*\\n\\)\\{-}.*\\*\\//FFdeletelaterFF/"
        exec beg | exec "normal 0f{" | exec "normal %" | exec "+1"
    endwhile
    " Удалим заготовочки
    silent! exec "%s/^\\s*FFdeletelaterFF\\n/"
    silent! exec "%s/\\s*FFdeletelaterFF/"
    " Чтобы не оставлять пробелы в конце строк, эту удалим в три шага
    silent! exec "%s/\\s*IIdeleteinlineII\\n/IIIgoodeolIII/"
    silent! exec "%s/\\s*IIdeleteinlineII/ /g"
    silent! exec "%s/\\s*IIIgoodeolIII\\n//"
endfunction
EOF

vim -E -o \
    -c 'source /tmp/exterm.vim' \
    -c 'bufdo silent! call Extercomms()' \
    -cwqa $list

# Memories
    #      // comment
    # -c 'bufdo silent! %s/\s*\/\/.*/' \
    #   /* comment */ endl
    # -c 'bufdo silent! %s/\s*\/\*.*\*\/\(\n\)/' \
    #   /** multiline comment */
    # -c 'bufdo silent! %s/\/\*\*\(\n\)\(.*\n\)* \*\/\n' \
    # list=$(find * -type f \( -name "*.c" \) -printf '%p ' ) ; vim -p $list


