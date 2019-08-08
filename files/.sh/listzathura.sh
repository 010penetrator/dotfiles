source $sh/dmenurc.sh
targ=$(find -L /ln/hh /ln/ho/use /ln/dwn $HOME/.cache/luakit/viewpdf/ -type f \( -iname "*.pdf" -or -iname "*.djvu" \) | dmenu $DMENU_OPTIONS)

if [ -n "$targ" ] ; then
    zathura "$targ"
fi

