#!/bin/bash
## Doesn't work!

list=$(find * -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.txt" \) -printf '"%p" ' )
# echo -e "--list is \n$list\n"

touch "$HOME"/cpconv.log
echo ----------------------------- | tee -a "$HOME"/cpconv.log
echo -e converting text files "cp1251-->UTF-8\n\t" at $(pwd) on $(date +%Y.%m.%d_%T) | tee -a "$HOME"/cpconv.log
# echo --candidat files list-- | tee -a "$HOME"/cpconv.log
# echo "$list" | tee -a "$HOME"/cpconv.log
# echo --edited files list-- | tee -a "$HOME"/cpconv.log

# Создать файл с функцией для Вима
# set fileencodings=ucs-bom,utf-8,default,cp1251,latin1
    # set fileencodings=ucs-bom,utf-8,default,cp1251,latin1
    # edit!
cat << 'EOF' > /tmp/cpconv.vim
function! Cpconv()
    let l = expand(&fileencoding)
    !echo 1
    exec '!echo ' . expand(l)
    edit! %
    if &fileencoding == "cp1251"
        !echo 2
        set fileencoding=utf-8
        write
        !echo % | tee -a "$HOME"/cpconv.log
        exec '!echo ' . expand('%:p') . " " . expand(l) . " CONVERTED"
    else
        !echo 3
        exec '!echo ' . expand('%:p') . " " . expand(l) . " nochange"
    endif
endfunction
EOF
        # call system('echo \"' . expand("%") . '\" | tee -a cpconv.log')

vim -E -o \
    -c 'set fileencodings=ucs-bom,utf-8,default,cp1251,latin1' \
    -c 'source /tmp/cpconv.vim' \
    -c 'bufdo  call Cpconv()' \
    -c wqa $list

# vim -Es -c 'argdo source /tmp/cpconv.vim | call Cpconv()' -c "qa" $list

echo
echo Updated log at "$HOME/cpconv.log"

