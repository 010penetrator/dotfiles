" vim: ts=4 sw=4 ft=vim
" vi: noswapfile

""  Initial preparations  ""
set nocompatible
set termguicolors
compiler gcc
set makeprg=make
" set makeprg=gcc\ %:p\ -o\ %:p:h/bin
" set makeprg=sh\ my_make.sh
set path=.,**
" set wildignore=*.swp
let $RTP=split(&runtimepath, ',')[0]
" let $RTP = expand('$HOME') . '/.vim'
if empty($VIMPLUG) | let $VIMPLUG = $RTP . "/plugged" | endif
" let vstatus = 300

""  Useful memories  ""
" help i_ctrl-
" help map-which-keys
" currfile=%\ mainbin
" let $BROWSER = 'luakit'
" .w !bash  "exec current line with bash
" %s/^\(\s\)\+$//g | "clean space lines
" s/\(|\|\\\)/\\\1/g "screen backslashes for saving vim command
" %s/\([\[\]]\) [\[\]]/\1\1/g " change '[ [' to '[[' and '] ]' to ']]'
" exec  "!"  . @"  "exec yank buffer
" read !ls -la  "paste shell output
" g/.\{20,\}/ exec "normal gqgq" | noh " format longer lines
" autocmd WinNew * set numberwidth=2 winheight=7
" Check lightline themes here
" read !ls $VIMPLUG/lightline.vim/autoload/lightline/colorscheme

""""""""""""""""""""""""
""       Plug:        ""
""""""""""""""""""""""""

if ( has('nvim')  && !filereadable($HOME."/.local/share/nvim/site/autoload/plug.vim") )
    echom "Will try to download Plug.vim for NeoVim"
    silent call system("curl -s --head -m 1 https://github.com 1>/dev/null && curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && echo success with curl!")
endif
if ( !has('nvim') && !filereadable($HOME."/.vim/autoload/plug.vim") )
    echom "Will try to download Plug.vim"
    silent call system("curl -s --head -m 1 https://github.com 1>/dev/null && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
endif

let g:vimplug_available=0
if has('nvim')
  if filereadable($HOME."/.local/share/nvim/site/autoload/plug.vim")
    let g:vimplug_available=1
  endif
elseif filereadable($HOME."/.vim/autoload/plug.vim")
  let g:vimplug_available=1
else
  let g:vimplug_available=0
endif
" if ! empty(execute('filter /plug.vim$/ scriptnames'))

" Oneliner to Plug on condition
    " Plug 'benekastah/neomake', has('nvim') ? {} : { 'on': [] }
" Same wrapped into a function
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
" Looks better
    " Plug 'benekastah/neomake', Cond(has('nvim'))
" With other options
    " Plug 'benekastah/neomake', Cond(has('nvim'), { 'on': 'Neomake' })

if (g:vimplug_available)
" Looks like vim-plug was loaded! Now plug the plugins
call plug#begin('$VIMPLUG')

" Good and sane
Plug 'junegunn/vim-plug'
Plug 'itchyny/lightline.vim' "cool
Plug 'justinmk/vim-sneak' "good!
Plug 'jlanzarotta/bufexplorer' "basic
Plug 'tpope/vim-sensible' "basic
Plug 'tpope/vim-commentary' , Cond(!has('nvim')) "good
Plug 'tpope/vim-vinegar' "basic
Plug 'tpope/vim-surround' "good
Plug 'tpope/vim-endwise' "okay
Plug 'tpope/vim-repeat' "handy
Plug 'tpope/vim-eunuch' "handy
Plug 'tpope/vim-ragtag' "ok
Plug 'tpope/vim-fugitive' "handy
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot' "okay HUGE
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object' "cool
Plug 'godlygeek/tabular' "okay
Plug 'jamessan/vim-gnupg' "good
Plug 'chrisbra/Colorizer' "good
Plug 'junegunn/goyo.vim' "usable
Plug 'haya14busa/vim-edgemotion' "good
Plug 'eiginn/netrw' "basic
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf' "cool

" good for Vim
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc'
if !has("nvim")
    " Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim'
    Plug 'majutsushi/tagbar' "okay
endif

" Try out now
Plug 'sandeepcr529/Buffet.vim' "good
Plug 'zefei/vim-colortuner' "fun
Plug 'Townk/vim-autoclose' "usable
Plug 'MattesGroeger/vim-bookmarks'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'will133/vim-dirdiff'

" Try out later
" Plug 'tpope/vim-unimpaired'
" Plug 'ZeroKnight/vim-signjump' "buggy
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'craigemery/vim-autotag' "errors
" Plug 'vim-scripts/LustyExplorer'
" Plug 'hari-rangarajan/CCTree'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'vim-scripts/QuickBuf'
" Plug 'Yggdroot/LeaderF'
" Plug 'ryanoasis/vim-devicons'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'
" Plug 'derekwyatt/vim-fswitch'
" Plug 'RRethy/vim-illuminate'

" Archive
" Plug 'wesleyche/SrcExpl' "mediocre
" Plug 'Shougo/denite.nvim' | Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'vim-scripts/CycleColor' "works
" Plug 'dense-analysis/ale' "works
" Plug 'kshenoy/vim-signature' "semi-usable
" Plug 'chrisbra/SaveSigns.vim' "usable

" NeoVim specific
if has("nvim")
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do':'make'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'chentoast/marks.nvim' " okay
    " Plug 'norcalli/nvim-colorizer.lua'
    " Plug 'kwkarlwang/bufjump.nvim'
    Plug 'hoschi/yode-nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lambdalisue/suda.vim'
    Plug 'numToStr/Comment.nvim'
    Plug 'karb94/neoscroll.nvim'
    Plug 'voldikss/vim-floaterm'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'lukas-reineke/onedark.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
endif

""""""""""""""""""""""""
""    Plug Colors:    ""
""""""""""""""""""{{{}}}

" gui themes need termguicolors set
Plug 'morhetz/gruvbox' "best
Plug 'ajmwagar/vim-dues' "soft coffee 'deus
Plug 'jpo/vim-railscasts-theme' "normal
Plug 'chriskempson/vim-tomorrow-theme' "Nice dark+light
Plug 'nanotech/jellybeans.vim' "good4html
Plug 'zsoltf/vim-maui' "darkOkay
Plug 'jedverity/feral-vim' "Nice
Plug 'mhartington/oceanic-next' "soft nice
Plug 'w0ng/vim-hybrid' "beautiful
Plug 'kristijanhusak/vim-hybrid-material' "nice Sane dark
Plug 'vim-scripts/strange' "darker
Plug 'severij/vadelma' "white good-con
Plug 'jacoborus/tender.vim' "sane soft dark
Plug 'cocopon/iceberg.vim' "soft cold dark
Plug 'vim-scripts/desertEx' "Nice gray
Plug 'AlessandroYorba/Alduin' "brown lowcon
Plug 'jnurmine/Zenburn' "tolerable
Plug 'jonathanfilip/vim-lucius' "day morning
Plug 'mtglsk/mushroom' "night
Plug 'CruizeMissile/Revolution.vim' "cool lowcont
Plug 'romainl/Apprentice' "nostrain
Plug 'Heorhiy/VisualStudioDark.vim' "mid con
Plug 'altercation/vim-colors-solarized' "yellow
Plug 'JarrodCTaylor/spartan' " 'spartan,immortals
Plug 'jlund3/colorschemer' "semibroken 'lucid
Plug 'pbrisbin/vim-colors-off'
Plug 'jakwings/vim-colors' "'moody,garden,messy
Plug 'vim-scripts/xterm16.vim' "variable
Plug 'Drogglbecher/vim-moonscape' "NIGHT
Plug 'bf4/vim-dark_eyes' "NIGHT
Plug 'noah/fu' "sane fallback
Plug 'MPiccinato/wombat256' "good dark
Plug 'vim-scripts/peaksea' "good trad dark+light
Plug 'vim-scripts/rdark-terminal' "good darker
Plug 'juanpabloaj/vim-pixelmuerto' "dark
Plug 'Lokaltog/vim-distinguished' "dark hicon
Plug 'arzg/vim-corvine' "good warm light&dark
Plug 'trevorrjohn/vim-obsidian' "satur
Plug 'sonph/onehalf', {'rtp': 'vim'} "Nice good tone HUGE
Plug 'gilsondev/lizard' "green dark
Plug 'ajh17/Spacegray.vim' "darker misty
Plug 'sickill/vim-monokai' "dark hicon
Plug 'beigebrucewayne/Turtles' "funky
Plug 'thomd/vim-wasabi-colorscheme' "dark normalcont
Plug 'vim-scripts/sift' "underwater_fantasy
Plug 'whatyouhide/vim-gotham' "neon/green
Plug 'bcicen/vim-vice' "joke
Plug 'vim-scripts/swamplight' "day
Plug 'vim-scripts/C64.vim' "joke
Plug 'szorfein/fantasy.vim' "dull
Plug 'ErichDonGubler/vim-sublime-monokai' "edit red?
Plug 'KimNorgaard/vim-frign' "borland_style
Plug 'vim-scripts/Gummybears' "very_dark
Plug 'szorfein/fromthehell.vim' "dark satur earth
Plug 'duckwork/nirvana' "shafran
Plug 'franbach/miramare' "earth dark
Plug 'koirand/tokyo-metro.vim' "pretty dark
Plug 'nightsense/rusticated' "morning
Plug 'KKPMW/sacredforest-vim' "lowcont
Plug 'nightsense/snow' "soft)
Plug 'logico-dev/typewriter' "good!
Plug 'wimstefan/vim-artesanal' "good lowcon gray
Plug 'yuttie/inkstained-vim' "very low con light
Plug 'nightsense/stellarized' "nice! light+dark
Plug 'rdavison/Libertine' "applejuice
Plug 'AlessandroYorba/Sierra' "softgray
Plug 'AlessandroYorba/Despacio' "softdarkgrey
Plug 'Jimeno0/vim-chito' "consbroken
Plug 'HenryNewcomer/vim-theme-underflow' "consbroken
Plug 'beigebrucewayne/min_solo' "consbroken 'subtle
Plug 'therubymug/vim-pyte' "light gui
Plug 'vim-scripts/proton' "light ok
Plug 'junegunn/seoul256.vim' "beautiful
Plug 'arzg/vim-mayanfog' "light
Plug 'arzg/vim-plan9' "trueeeee
Plug 'lithammer/vim-eighties' "trueeeee
Plug 'sainnhe/gruvbox-material' "improved
Plug 'arzg/vim-substrata' "cold neon
Plug 'sainnhe/edge' "good soft
Plug 'sainnhe/everforest' "cream lowcon
Plug 'sainnhe/archived-colors' "atlantis,cryslominsa,desert_night,fairy_garden,grimoire,ice_age,lost_shrine,vanilla_cake
Plug 'flrnd/plastic.vim' "juicy
Plug 'EdenEast/nightfox.nvim'
Plug 'atelierbram/vim-colors_atelier-schemes' "mindfuck
Plug 'nightsense/vimspectr' " need gui
Plug 'colepeters/spacemacs-theme.vim' "cool
Plug 'stulzer/mitormk-laser' "sharp
Plug 'relastle/bluewery.vim' "low-con
Plug 'gmoe/vim-espresso' "mild
" Plug 'dfrunza/vim' "borland,muratori,pencil,vc6
" Plug 'dracula/vim' "funky
" Plug 'tomasr/molokai' "shitty
Plug 'NLKNguyen/papercolor-theme' "soft white 'PaperColor
Plug 'markeganfuller/vim-journeyman' "pale dark
Plug 'machakann/vim-colorscheme-tatami' "fun green
" Plug 'srcery-colors/srcery-vim' "fresh-dark consbroken HUGE
Plug 'victorze/foo' " 'abyss,github-old,hacker,hyper,mr-robot
Plug 'stillwwater/vim-nebula' "cold dark
Plug 'sainnhe/sonokai' "great dark gui&nogui
Plug 'franbach/miramare' "coffee dark
Plug 'Mizux/vim-colorschemes' "better nogui pencil
Plug 'zefei/simple-dark'
Plug 'zefei/cake16' "cool medium
Plug '010penetrator/vim-colors-forplasma' "collection
" Plug 'RussellBradley/vim-knicks' "great blue 404
" Plug 'aradunovic/perun.vim' "consbroken 404
" Plug 'the31k/vim-colors-tayra' "Nice gray 404
Plug 'ayu-theme/ayu-vim'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
call plug#end()
endif

""""""""""""""""""""""""
""     Settings:      ""
""""""""""""""""""""""""

let g:completion_enable_auto_popup = 1
let g:goyo_width = "66%"
let g:goyo_height = "95%"

let g:startify_bookmarks = [ {'s': '~/.sh'}, '/ln/lo/cur/' ]
let g:startify_files_number = 8
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
            " \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
let g:startify_session_dir = $RTP . "/session"

set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,default,cp1251,latin1
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" set keymap=russian-jcukenwin
set colorcolumn=
set noequalalways
set winheight=7
" set iminsert=0
" set imsearch=0
" set nofoldenable    " disable folding
set tabstop=2 softtabstop=2 expandtab shiftwidth=4 smarttab
set textwidth=0 wrapmargin=0
set smartindent
set invlinebreak
set sidescroll=12
set list lcs=tab:\┊\ 
set scrolloff=2
set number
set numberwidth=2
set signcolumn=number
set showmode
set hls
noh
set incsearch
set linebreak
set ignorecase
set smartcase
set magic
set matchtime=2
set switchbuf=useopen
set splitbelow
set splitright
set display=lastline
set hidden
" set fileformat=unix
set title

if !isdirectory($RTP)
  call mkdir($RTP, '', 0770)
endif
" Handle backups
if !isdirectory($RTP . "/bak")
  call mkdir($RTP . "/bak", '', 0700)
endif
silent ! find $RTP/bak -type f -mtime +30 -delete
set backupdir=$RTP/bak
set undodir=$RTP/bak
set undofile
set directory=$RTP/bak
set swapfile
set sessionoptions+=globals
set history=2500

set t_Co=256
"  if $TERMINAL == 'xterm' | set term=xterm-256color | endif
if $TERMINAL =~ 'kitty' | let &t_ut='' | endif

if has('mouse') | set mouse=a | endif
if &t_Co > 2 || has("gui_running")
    syntax on
    let c_comment_strings=1
endif

augroup Sessload
    autocmd!
    autocmd SessionLoadPost * silent LoadColor
augroup END
augroup SaveNotepad
    autocmd!
    autocmd FocusLost 99.txt update
    autocmd BufLeave  99.txt update
augroup END

" autocmd SessionLoadPost * echom "Welcome back"
autocmd WinNew * set numberwidth=2
autocmd FileType c setlocal commentstring=//%s
autocmd FileType cpp setlocal commentstring=//%s
autocmd FileType text setlocal commentstring=#%s
autocmd FileType cmake setlocal commentstring=#%s
autocmd FileType c setlocal colorcolumn=0
" autocmd CursorHold * normal! m'

" Taming netrw
autocmd FileType netrw setl bufhidden=wipe
" autocmd FileType netrw setl bufhidden=delete
augroup my_netrw_mapping
    autocmd!
    autocmd filetype netrw call MyNetrwMapping()
augroup END
function! MyNetrwMapping()
    noremap <buffer> x :q<cr>
    nnoremap <buffer> a <Nop>
endfunction
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
" make vim-sneak respect netrw
let g:sneak#map_netrw = 0

if executable('rg')
    set grepprg=rg\ --smart-case\ --vimgrep\ --follow\ --no-ignore\ -g\ '!tags'
    " Output of :grep should go to cwindow
    autocmd QuickFixCmdPost *grep* cwindow
elseif executable('ag')
endif

" Remember last tab to use it later!
if !exists("g:lasttab")
    let g:lasttab = 1
endif
au TabLeave * let g:lasttab = tabpagenr()

""  Plugin specific setttings  ""

let g:GPGPreferSymmetric=1
set foldmethod=marker
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/ultisnips"]
let g:solarized_termcolors=256
let xterm16_brightness = '#aac8c2' | let xterm16_colormap='soft'
let g:seoul256_background = 234
let g:deoplete#enable_at_startup = 1

" let g:SrcExpl_pluginList = [ "__Tag_List__" ]
" let g:ScrExpl_refreshTime=200
" let g:SrcExpl_winHeight = 13

if has("cscope")
    " set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ''
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>S :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>G :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>C :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>T :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>E :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>F :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>I :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>D :scs find d <C-R>=expand("<cword>")<CR><CR>
endif

""""""""""""""""""""""""
""      NeoVim:       ""
""""""""""""""""""""""""

if has("nvim")
    set laststatus=3
    highlight WinSeparator guibg=none
    highlight WinSeparator guifg=#5a5a5a
endif

""""""""""""""""""""""""
""     Mappings:      ""
""""""""""""""""""{{{}}}

set timeoutlen=500
let g:AutoClosePumvisible = {"ENTER": '', "ESC": ''}
let mapleader = ","
" nnoremap q\
" nnoremap z' `

" Free <q> key
map q <Nop>
map й q
nnoremap Q q
nnoremap qr @@
nnoremap qm @

" Free <a> key
nnoremap a <Nop>
map ф a
nnoremap aa a

" go back to normal mode with <j> double tap
imap jj <ESC>
imap оо <ESC>

" go to end-of-line
imap <C-e> <C-o>A

imap <C-l> <Right>

" double <esc> will switch off search highlighting
" nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>

" <x> and <s> will delete to no buffer
noremap x "_x
noremap X "_X
noremap c "_c
noremap C "_C
" noremap s "_s

" Editing
nnoremap qo o<Esc>
nnoremap qi O<Esc>
nnoremap qu ~
nnoremap cx s
" swap two chars
nnoremap gx dlp
" add space inside brackets
nmap a<space> ysib<space><space>
" allows to undo accidental CTRL-U in insert mode
inoremap <C-U> <C-G>u<C-U>
nnoremap dx 0"_D
nnoremap dX ^"_D
nnoremap dc "_d$
nnoremap d. "_dd
nnoremap d<space> :call DelSpace()<Esc>
" start fat new line
nnoremap cm O<Esc>o
" insert new line after current paragraph
nnoremap c<CR> }:if (line(".") == line("$")) \| exec "normal o" \| endif<CR>O
" add horizontal line
nnoremap q- 60A-<esc>0<esc>60ld$b
nnoremap q= 60A=<esc>0<esc>60ld$b
" nmap q- O1<esc>gcc$xj^d0o<esc>0d$60i-<esc>kkJJ^60ldc0W
" insert one char
nnoremap af :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap ag :exec "normal! a".nr2char(getchar())."\e"<CR>

" Move around
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap <Down> gj
vnoremap <Up>   gk
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk
nmap <C-c> <C-y>
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>
nnoremap ,ze :call SwitchCE()<CR>
" jump last edit edges
nnoremap [e `[
nnoremap ]e `]
" select last changed/yanked text
nnoremap [] `[v`]
" jump last selection edges
nnoremap [v `<
nnoremap ]v `>
" navigate quickfix list
nnoremap q<Up>   :cprev<CR>
nnoremap q<Down> :cnext<CR>
nnoremap <C-Up> :cprev<CR>
nnoremap <C-Down> :cnext<CR>
" navigate in diff mode
nnoremap <F2> [czz
nnoremap <F3> ]czz
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>
" nmap s <Plug>Sneak_s
" nmap S <Plug>Sneak_S
noremap <c-n> 12<c-e>
noremap <c-p> 12<c-y>
map <c-j> <Plug>(edgemotion-j)
map <c-k> <Plug>(edgemotion-k)
" go to text start/finish in file
nnoremap g<Home>   gg:call search('^.') <CR>k
nnoremap g<End> G$:call search('^.','b') <CR>0j
" nnoremap gT  gg:call search('^.') <CR>k
" nnoremap gB  G$:call search('^.','b') <CR>0j
" search such //comments//
nnoremap am /\s*\/\/.*\/\/$<CR>
" jump to blank or one-char lines
nnoremap <silent> gn :call search('^\(.\\|\(\s\)*\)$','W') <CR>
nnoremap <silent> gp :call search('^\(.\\|\(\s\)*\)$','bW') <CR>
onoremap <silent> gn :call search('^\(.\\|\(\s\)*\)$','W') <CR>
onoremap <silent> gp :call search('^\(.\\|\(\s\)*\)$','bW') <CR>

" For vim-signature
" nmap ]s ]-
" nmap [s [-
" nnoremap m-       :<C-U>call signature#mark#Purge("all")<CR>
" nnoremap m<space> :<C-U>call signature#mark#Purge("line")<CR>

" Open and close files (buffers)
nnoremap aw :w<CR>
nnoremap qx :q<CR>
nnoremap ,x :q<CR>
nnoremap qg :tabclose<CR>
nnoremap ,q :qa <CR>
nnoremap ,d :bd!<CR>
nnoremap ,bd :BDnJump<CR>
nnoremap ,i :diffthis \| wincmd w<CR>
nnoremap ,o :diffoff  \| wincmd w<CR>
nnoremap c<space> :echo expand ('%') '.@.' getcwd() <CR>
nnoremap ,c. :LCDhere <CR>
nnoremap ,cg :call ClimbToDirWhere(".git/index",1) \| pwd <CR>
nnoremap ,cm :call ClimbToDirWhere("Makefile",1) \| pwd <CR>
" local cd to current kinda project path
nnoremap <silent> ,c, :call GetProjDir() <bar> exec "lcd " . b:proj_dir <bar> echo 'lcd @' getcwd() <cr>
nnoremap a<BS> :checktime<cr>
nnoremap q<BS> :enew<CR>
nnoremap z<BS> :e!<CR>
" new split to netrw
nnoremap a-  : split <bar> exec "normal -" <cr>
nnoremap a_  :vsplit <bar> exec "normal -" <cr>
" nnoremap a<CR> :e <c-r><c-f> <CR>
" split open file under cursor
nnoremap ae :vsp <c-r><c-f> <CR>
nnoremap aE :sp <c-r><c-f> <CR>
" open file under cursor in previous window
nnoremap a<tab> :wincmd p \| e <c-r><c-f> <CR>
" split open current location with netrw
nnoremap as :wincmd s \| e %:p:h <CR>
nnoremap av :wincmd v \| e %:p:h <CR>
nnoremap qs :new  \| lcd #:p:h \| echo expand ('%') '.@.' getcwd() <CR>
nnoremap qv :vnew \| lcd #:p:h \| echo expand ('%') '.@.' getcwd() <CR>
nnoremap qS :split # <cr>
nnoremap qV :vsplit # <cr>
nnoremap <C-W>S :vsplit<CR>
nnoremap an :tabe %:p:h <CR>
" nnoremap ,. <C-^>
nnoremap <silent> ,. :if bufexists(bufnr('#')) <bar> b # <bar> echo expand('%') <bar> else <bar> echo 'No prev buffer.' <bar> endif<CR>
nnoremap ,by :call BufYank()<CR>
nnoremap ,bp :call BufPut()<CR>

" Handle windows
nnoremap qh    <C-W>h
nnoremap qj    <C-W>j
nnoremap qk    <C-W>k
nnoremap ql    <C-W>l
nnoremap <C-\> <C-W>w
nnoremap q,    <C-W>6<
nnoremap q.    <C-W>6>
nnoremap qe    <C-W>4+
nnoremap qd    <C-W>4-
nnoremap aq    <C-W>_
nnoremap az    <C-W>80-
nnoremap qa    <C-W>_<C-W>\|
nnoremap qz    <C-W>=
nnoremap aj    <C-W>w<C-W>_
nnoremap ak    <C-W>W<C-W>_
nnoremap q<tab> <C-w>p
" swap current and previous window
" silent nnoremap a<tab> :call WinSwap()<CR><C-W>p
silent nnoremap c<tab> :call WinSwap() <bar> wincmd p<CR><Esc>

" Handle tabs
nnoremap at :tabe<CR>
nnoremap aT :-tabe<CR>
nnoremap <C-PageUp> gT
nnoremap <C-PageDown> gt
nnoremap gr gT
nnoremap q] gt
nnoremap q[ gT
nnoremap q{ :tabmove -1 <CR>
nnoremap q} :tabmove +1 <CR>
nnoremap q< :call MoveToPrevTab()<CR>
nnoremap q> :call MoveToNextTab()<CR>
" select previous tab
nnoremap g<tab> :exe "tabn ".g:lasttab<CR>
nnoremap q1 1gt
nnoremap q2 2gt
nnoremap q3 3gt
nnoremap q4 4gt
nnoremap q5 5gt
nnoremap q6 6gt
nnoremap q7 7gt
nnoremap q8 8gt
nnoremap q9 9gt
nnoremap gz 1gt

" Navigate buffers/files
nnoremap ,bj :Unite buffer file<CR>
nnoremap ,bi :Unite buffer file<CR>i
nnoremap ,bk :Denite buffer -mode=normal -immediately-1<CR>
nnoremap ,be :BufExplorer<CR>
nnoremap ,,e :BufExplorer<CR>
nnoremap ,bl :Telescope buffers theme=ivy<CR>
nnoremap ,to :Telescope oldfiles<CR>
nnoremap ,zf :Files<CR>
nnoremap ,zg :GFiles<CR>
nnoremap ,zl :Lines<CR>
nnoremap ,zs :Files $sh<CR>
nnoremap ,zt :Files $tt<CR>
nnoremap ,zj :Files $jo<CR>
nnoremap qf  :FilesProj<CR>
nnoremap ,/ :Telescope find_files search_dirs=$sh,$tt,$lo<CR>

" Search text
nnoremap ,zr :Rg<CR>
nnoremap ,tg :Telescope live_grep<CR>
nnoremap ,tf :Telescope find_files theme=ivy<CR>
nnoremap ,tr :Telescope lsp_references<CR>
" nnoremap ,tt :Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout_config={"prompt_position":"top"}<CR>
" nnoremap ,tt <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", theme="ivy"})<CR>
nnoremap ,tb <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy{})<CR>

" Jump to favourite files
nnoremap ,gv :call FocusBufOrDo('init.vim','e $sh/vi/init.vim')<CR>
nnoremap ,gi :call FocusBufOrDo('init.lua','e $sh/vi/init.lua')<CR>
nnoremap ,g, :call FocusBufOrDo('vimrc$','e $MYVIMRC')<CR>
nnoremap ,gt :call FocusBufOrDo('vimrc_themes','e $sh/vi/vimrc_themes')<CR>
nnoremap ,gb :call FocusBufOrDo('bashrc','e $sh/bashrc')<CR>
nnoremap ,gB :call FocusBufOrDo('bashrc.local','e $lo/bashrc.local')<CR>
nnoremap ,g2 :call FocusBufOrDo('bspwm$','e $sh/bspwmrc')<CR>
nnoremap ,gx :call FocusBufOrDo('sxhkd','e $sh/conf/sxhkdrc')<CR>
nnoremap ,gk :call FocusBufOrDo('kitty.conf','e $sh/conf/kitty.conf')<CR>
nnoremap ,gr :call FocusBufOrDo('rc.sh','e $sh/rc.sh')<CR>
nnoremap ,gz :call FocusBufOrDo('zzzz','e $tt/zzzzzz')<CR>
nnoremap ,gu :call FocusBufOrDo('ff','e $tt/u*/ff*')<CR>
nnoremap ,gh :call FocusBufOrDo('sh_history','e $HOME/.bash_history')<CR>G
nnoremap ,gl :call FocusBufOrDo('1linux','e $sh/rs/1linux')<CR>
nnoremap q/  :call FocusWindowOrDo('99.txt','1tabn \| wincmd b \| e $buf')<CR>

nnoremap ,,v :Goyo<CR>

" Start and quit Vim
nnoremap ,V :source $MYVIMRC <CR>
nnoremap ,vv :source $MYVIMRC <CR>
nnoremap ,cs :LoadColor<CR>
nnoremap ,vs :source $RTP/session/comon <bar> call AddRpcEar()<CR>
nnoremap ,,q :call SaveColor() <bar> SSave! comon <bar> qa<CR>
nnoremap ,,s :call SaveColor() <bar> SSave! comon<CR>
nnoremap ,vq :qa! <CR>
nnoremap ,l :Startify<CR>
nnoremap ,zq :wa <bar> qa<CR>
nnoremap ,ar :call AddRpcEar()<CR>
" Open current file at vimserver session via my "vimrpc" shell script
nnoremap ,aa :silent exec '! virpc "%:p"' <CR>
nnoremap ,a. :exec '! virpc "%:p"' \| q <CR>
nnoremap ,ac :exec '! MODE=cur    virpc "%:p"' \| q <CR>
nnoremap ,an :exec '! MODE=newtab virpc "%:p"' \| q <CR>
nnoremap ,as :exec '! MODE=split  virpc "%:p"' \| q <CR>

" Have mappings in terminal mode
if v:version >= 801
    tmap oo <C-w>N:set nonumber<CR>
    tmap o<C-o> <C-w>N :e #<CR>
    tmap <C-x> <C-w>N :BDnJump<CR>
    tnoremap <C-PageUp> <C-w>:tabprev<CR>
    tnoremap <C-PageDown> <C-w>:tabnext<CR>
    tnoremap g<tab> <C-w>:exe "tabn ".g:lasttab<CR>
    tnoremap q<tab> <C-w>p
    tmap <C-\> <C-w>w
endif
if has('nvim')
    tnoremap oo <C-\><C-n>
    tnoremap o<C-o> <C-\><C-n>:e #<CR>
    tnoremap <C-x> <C-\><C-n>:BDnJump<CR>
    tnoremap <C-PageUp> <C-\><C-n>:tabprev<CR>
    tnoremap <C-PageDown> <C-\><C-n>:tabnext<CR>
    tnoremap g<tab> <C-\><C-n>:exe "tabn ".g:lasttab<CR>
    tnoremap q<tab> <C-\><C-n>:wincmd p<CR>
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
endif

" Scroll fraction of the screen
let scrollpart=82
let key4=""
let key15=""
nnoremap <silent> <Space> :exec 'normal! '.float2nr(round(winheight(0)*(exists("b:scrollpart") ? b:scrollpart : g:scrollpart)*0.01))."<C-d>"<CR>
nnoremap <silent> <BS>    :exec 'normal! '.float2nr(round(winheight(0)*(exists("b:scrollpart") ? b:scrollpart : g:scrollpart)*0.01)).key15<CR>
" nnoremap <silent> <CR>    :exec 'normal! '.float2nr(round(winheight(0)*(exists("b:scrollpart") ? b:scrollpart : g:scrollpart)*0.01))."<C-d>"<CR>
" nnoremap <silent> <tab>   :exec 'normal! '.float2nr(round(winheight(0)*(exists("b:scrollpart") ? b:scrollpart : g:scrollpart)*0.01)).key15<CR>

" Preserve jumplist
nnoremap <silent> H :<C-u>execute "keepjumps norm! " . v:count1 . "H"<CR>
nnoremap <silent> M :<C-u>execute "keepjumps norm! " . v:count1 . "M"<CR>
nnoremap <silent> L :<C-u>execute "keepjumps norm! " . v:count1 . "L"<CR>
nnoremap <silent> * :<C-u>execute "keepjumps norm! " . v:count1 . "*"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{zz"<CR>
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}zz"<CR>
nnoremap <silent> n :<C-u>execute "keepjumps norm! " . v:count1 . "nzz"<CR>
nnoremap <silent> N :<C-u>execute "keepjumps norm! " . v:count1 . "Nzz"<CR>

" Handle copy registers
nnoremap ay "+yiW
nnoremap ap :put  *<CR>
nnoremap aP :put! *<CR>
nnoremap ai :put  +<CR>
nnoremap aI :put! +<CR>
" copy Vim copy register to system copy buffers
nnoremap qy :let @+ = @" <bar> :let @* = @" <CR>
" put select system buffer as single paragraph
nnoremap ao o<Esc>:put! *<CR>`[v`]:g/^$/d<CR>:noh<CR>
nnoremap aO o<Esc>:put! +<CR>`[v`]:g/^$/d<CR>:noh<CR>
" yank inline
nnoremap yc ^y$"+y$"*y$
" yank current file full path/name
nnoremap y<tab> :let @" = expand('%:p')
" replace current word with register contents
nnoremap cp "_ciw<c-r>"<esc>
nnoremap co "_ciw<c-r>*<esc>
nnoremap cO "_ciw<c-r>+<esc>

" Commanding Vim
nnoremap q; :<up>
vnoremap q; :<up>
nnoremap qq :
cnoremap <C-a> <Home>
cnoremap <C-b> <C-Left>
cnoremap <C-t> <C-Right>

nnoremap ,; :6mes<CR>
" Eval yanked
nnoremap yq :@"<CR>
" Add Plug entry
nnoremap ,vp :put + <bar> exec "normal dfmxIPlug 'A'" <CR>==
nnoremap ,vu :source /ln/sh/vi/init.vim <bar> PlugUpdate <CR>
" Evaluate one line as Vimscript
nnoremap ,vl yy:@"<CR>
" Evaluate a paragraph as Vimscript and re-run last command
nnoremap ,v<CR> yap:@"<CR>:<up><CR>
" Evaluate one line or one paragraph as Vimscript
nnoremap ,v, :call EvalThis()<CR>
" Evaluate a paragraph as Vimscript
nnoremap ,v; :let lastl=line('.') <bar> exec "normal yap" <bar> @\" <bar> exec lastl<CR>:echo "Evaluated current paragraph."<CR>

" Open current location with vifm within vim
nnoremap ac :terminal ++close bash -c "INVIM=1 vifm %:p:h"<CR>
nnoremap aC :vertical terminal ++close bash -c "INVIM=1 vifm %:p:h"<CR>
nnoremap a; :terminal ++kill=term ++curwin ++close bash -c "INVIM=1 vifm %:p:h"<CR>
nnoremap a: :tabe \| terminal ++kill=term ++curwin bash -c "INVIM=1 vifm #:p:h"<CR>

" Split open terminal at current location
nnoremap ab : new \| if isdirectory(expand('#:p:h')) \| lcd #:p:h \| endif \| terminal ++kill=term ++curwin ++norestore <CR>
nnoremap aB : vnew \| if isdirectory(expand('#:p:h')) \| lcd #:p:h \| endif \| terminal ++kill=term ++curwin ++norestore <CR>
" Open terminal at current location
nnoremap qb : if isdirectory(expand('%:p:h')) \| lcd %:p:h \| endif \| terminal ++kill=term ++curwin ++norestore <CR>

" Spawn a terminal outside vim
nnoremap ,,t :NewTermHere<CR>
" Spawn vifm in terminal outside vim
nnoremap ,,c :NewVifmHere<CR>

" Jump to terminal window
nnoremap qt :call GotoTerm(0)<CR>
" Jump to netrw window
nnoremap ,n :call RaiseNetRW()<CR>

" Exec current paragraph with shell
nnoremap ,B yap: exec "!" . @" <CR>

" Exec selection with shell
vnoremap ,b :call RunSelBash()<CR>

" Call system
" system open current path
nnoremap ,C :Silent xdg-open %:p:h &<CR>
" system open current file
nnoremap ,O :Silent xdg-open %:p &<CR>
" system open current line (usable for http links)
nnoremap ,,o ^y$:call system('xdg-open ' . "'" . @" . "' &")<CR>
" system open selected lines
vnoremap ,,o :<C-U>call SystemOpenEveryLine()<CR>
" open current line with firefox
nnoremap ,M ^y$:call system('firefox ' . "'" . @" . "' &")<CR>
" google current line
nnoremap ,go ^y$:call system('google.sh ' . "'" . @" . "'")<CR>
" yandex current line
nnoremap ,gy ^y$:call system('yandex.sh ' . "'" . @" . "'")<CR>
" wiki current line
" nnoremap ,gr ^y$:silent exec " !source $HOME/.bashrc && chromium \"wiki " . @" . "\" &>/dev/null & " \| redraw!<CR>

" Appearance
nnoremap z; :set wrap!<CR>
nnoremap ,zz :let &scrolloff=28-&scrolloff<CR>
nnoremap ,zc :let &colorcolumn=80-&colorcolumn<CR>
nnoremap ,zn :set number!<CR>
nnoremap z<space> :set filetype=text<CR>
nnoremap ,vb :call SwitchBackground() <CR>:echo "background=" &background <cr>
nnoremap ,vg :set termguicolors! <cr>:set termguicolors? <cr>
nnoremap a/ :set hlsearch! <CR>
nnoremap ,gg :GitGutterToggle<CR>

" Tags
nnoremap ,vt :TagbarOpen fj <CR>
" nnoremap ,* :silent exec 'UpdCtags' \| redraw! \| echo 'Wrote tags db in' getcwd().'/' <CR>
" nnoremap ,* :call UpdCtagsHereDeps() <CR>
" nnoremap ,* :call UpdCtagsGitDeps() <CR>
" nnoremap ,* :call UpdCtagsGit() <CR>

" Make and run project
nnoremap ,zo :make <bar> copen <CR>
nnoremap ,zm :call BuildProjectUni("my_Makefile","make -f my_Makefile")<CR>
nnoremap ,zc :call BuildProjectUni("Makefile","make -f my_Makefile clean")<CR>
nnoremap ,zx :call BuildProjectUni("Makefile","make -f my_Makefile run")<CR>
nnoremap ,zb :call BuildProjectUni("Makefile","make -f my_Makefile bear")<CR>
" nnoremap ,XX :call BuildProjectUni("Makefile","make tags") <bar> cwindow <CR>
" nnoremap ,zm :lcd %:p:h <bar> call BuildProjectUni("Makefile","make -f my_Makefile") <bar> redraw! <bar> copen <CR>
nnoremap ,z/ :copen<CR>/error<CR>

" Folding
vnoremap ,cf :<C-U>call FoldSelection()<CR>
nnoremap ,cf :set opfunc=FoldMotion<cr>g@

" Save last insert as Macro at "l"
command! -nargs=1 LastToMacro exec "let @" . <q-args> . " = \"i\" . @. . \"<Esc>\""
nnoremap qL :LastToMacro l<CR>

" Show current dir & current file stats
nnoremap ,zl : silent exec '! echo -e "\n$(pwd):"; ls -la . ; echo \. ; ls -la %:p ; read -n 1 -s -r -p "//hit.anykey" ; echo -ne "\n" ' \| redraw! <cr>

""""""""""""""""""""""""
""     Commands:      ""
""""""""""""""""""""""""

command! -nargs=1 Silent exec 'silent !' . <q-args> | exec 'redraw!'
  "Usage : Silent ls; read -rsn1 -p "//hit.anykey"; echo;

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis

" Sum lines of numbers in range
command! -range Sum :echo eval(substitute(join(getline(<line1>,<line2>),'+'),',','.',"g"))

command! SuW w !sudo tee %
command! SuE r !sudo cat %
command! Fdel :silent exec '!rm %' | redraw! | bd
command! KIR e ++enc=cp1251 | set fileencoding=utf-8 | set fileformat=unix
" command! C1KIR e ++enc=cp1251 | set fileencoding=utf-8 | set fileformat=unix | wq
command! F set fileencoding=utf-8 | set fileformat=unix

function! RunSelBash()
    echo system(join(getline(a:firstline,a:lastline), "\n"))
endfunction

" command! SessWriteA call SaveColor() | call TerminalsFuneral() | mksession! $RTP/session.vim | SaveSigns! $RTP/signs.sav
" command! SessWriteB exec 'SessWriteA' | call BufFocusedThenDo('signs.sav','wq')

command! Bash exec 'silent ! bash' | redraw!
command! NewTerm exec 'silent ! $TERMINAL &' | redraw!
command! NewTermHere exec 'silent ! cd "%:p:h" && $TERMINAL &' | redraw!
command! NewVifmHere exec 'silent ! $TERMINAL -e vifm --select %:p & ' | redraw!
command! LCDhere lcd %:p:h | pwd
command! LCDrealpath let b:cwd = expand("%:p:h") | let b:rcwd = system("realpath " . b:cwd) | exec "lcd " . b:rcwd

command! FollowSymLink let b:symlink = expand("%:p") | execute "file " . resolve(expand("%")) | edit
command! UnFollowSymLink exec 'file ' . b:symlink | edit

command! UpdCtags !ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *
command! UpdCtagsSudo !sudo ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *

command! Yall %y "
command! Dall %d _
command! Call %d _ | put!
command! SwapContentPrevWin :call SwapContentPrevWin()

command! -bang FilesProj call GetProjDir() <bar> call fzf#vim#files(expand(b:proj_dir), fzf#vim#with_preview({'options': ['--layout=reverse','--info=inline']}), <bang>0)

""""""""""""""""""""""""
""     MS_stuff:      ""
""""""""""""""""""""""""

if !empty($WINDIR)
" If windows
  " set makeprg=\./make.bat
  " set makeprg=\./make.bat\ -j4\ DEBUG=1
  " nnoremap qp :put + <CR>j
    command! RCbash :exec '!source /c/Users/user/.bashrc'
    command! NewTerm exec 'silent ! mintty.exe &' | redraw!
    command! UpdCtags !ctags.exe -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *
  command! Chrome :silent exec '!source /c/Users/user/.bashrc && chrome "%"' | redraw!
  command! Npp :silent exec '!source /c/Users/user/.bashrc && npp "%"' | redraw!
  command! XYp :silent exec '!source /c/Users/user/.bashrc && exp "%:p:h" &' | redraw!
endif

""""""""""""""""""""""""
""       Menus:       ""
""""""""""""""""""""""""

set wildmenu
set wcm=<tab>
map ,<tab> :emenu tagi.<tab>
" menu tagi.ru :setlocal spell spelllang=ru <CR>
menu tagi.basic   :silent exec 'UpdCtags' \| redraw! \| echo 'Wrote tags db in' getcwd().'/' <CR>
menu tagi.dirDeps :call UpdCtagsDirDeps() <CR>
menu tagi.gitDeps :call UpdCtagsGitDeps() <CR>
menu tagi.git     :call UpdCtagsGit() <CR>

""""""""""""""""""""""""
""      Macros:       ""
""""""""""""""""""""""""

let @g = ",gggg2zjjzzao:call DoOnKey(\"103\",\"b #\")\n"
let @s = "i \<Esc>ll."

""""""""""""""""""""""""
""     Functions:     ""
""""""""""""""""""{{{}}}

function! RunSelBash()
    echo system(join(getline(a:firstline,a:lastline), "\n"))
endfunction

function! UpdCtagsDirDeps()
    echom "Trying to update ctags with deps in this directory"
    silent exec '! echo -e "\n\n"Trying to update ctags with deps in this directory"..."'
    exec '! $sh/ctags_with_deps.sh $(find . -type f -name \*.[ch])'
endfunction

function! UpdCtagsGitDeps()
    echom "Trying to update ctags with deps in this git project"
    silent exec '! echo -e "\n\n"Trying to update ctags with deps in this git project"..."'
    let l:starting_directory = getcwd()
    let l:curr_directory = expand('%:p:h')
    exec "cd " . l:curr_directory
    let l:proj_dir = ClimbToDirWhere(".git/index",1)
    if ( l:proj_dir != "-1" )
        silent exec '! echo Found .git in $PWD/'
        " exec '!ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *'
        exec '! $sh/ctags_with_deps.sh $(find . -type f -name \*.[ch])'
    else
        echom "Cant find .git"
    endif
    exec "cd " . l:starting_directory
endfunction

function! UpdCtagsGit()
    echom "Trying to update ctags in this git project"
    silent exec '! echo -e "\n\n"Trying to update ctags in this git project"..."'
    let l:starting_directory = getcwd()
    let l:curr_directory = expand('%:p:h')
    exec "cd " . l:curr_directory
    let l:proj_dir = ClimbToDirWhere(".git/index",1)
    if ( l:proj_dir != "-1" )
        silent exec '! echo Found .git in $PWD/'
        exec '!ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *'
    else
        echom "Cant find .git"
    endif
    exec "cd " . l:starting_directory
endfunction

function! AddRpcEar()
    echo "Will launch an rpc server with default address for this editor.."
    if has('nvim')
        if empty($NVIMSERV)
            echom "NO way! Rpc address for neoVim not provided"
        elseif filereadable(expand($NVIMSERV))
            echom "NO way! Desired RPC address is already taken -- " . expand($NVIMSERV)
        else
            call serverstart(expand($NVIMSERV))
        endif
    elseif v:version >= 800
        if !empty($VIMSERV)
            if empty(v:servername)
                call remote_startserver(expand($VIMSERV))
            else
                echom "Sorry, this Vim instance already runs an rpc server"
            endif
        else
            echom "Rpc address for Vim not provided"
        endif
    endif
endfunction

function! BuildProject1()
    let l:starting_directory = getcwd()
    let l:curr_directory = expand('%:p:h')
    exec "cd " . l:curr_directory
    exec '!echo -e "\n"============ $(date) ============"\n"@ $PWD'
    make
    exec '!echo -e "==Done build==\n"'
    exec "cd " . l:starting_directory
endfunction

" function! MakeClean()
"   silent exec '!echo -e "\n=-=-=-=-=-=-=-=-=-=-=-=-=-="'
"   silent exec "!make clean"
"   redraw!
" endfunction

function! BuildProjectUni(Makefile,Makecommand)
    " exec "!echo " . a:Makecommand . ":"
    " memorize stuff
    let l:makeprg_bak = &makeprg
    let &makeprg = a:Makecommand
    let l:starting_directory = getcwd()
    let l:curr_directory = expand('%:p:h')
    " change directory
    exec "lcd " . l:curr_directory
    let l:proj_dir = ClimbToDirWhere(a:Makefile,1)
    " " !!! ignore cmake-generated Makefile
    while filereadable("vim_make_ignore")
        cd ../
        let l:proj_dir = ClimbToDirWhere(a:Makefile,1)
    endwhile
    if ( l:proj_dir != "-1" )
        if has('nvim')
            echo system("echo -e \"\\n\\n\"--" . a:Makecommand . " @ " . l:proj_dir . ":")
            echo system("echo ------------------------------------------------")
            make
        else
            silent exec "!echo -e \"\\n\\n\"--" . a:Makecommand . " @ " . l:proj_dir . ":"
            silent exec "!echo ------------------------------------------------"
            silent make
        endif
        " exec '! ' . a:Makecommand
    else
        exec '! echo Makefile not found!'
        echo "Makefile not found!"
    endif
    " reset stuff
    silent exec "lcd " . l:starting_directory
    let &makeprg = l:makeprg_bak
    " exit with rituals
    if !has('nvim')
        Silent read -n 1 -s -r -p "//hit.anykey" ; echo -ne "\n\n"
        redraw!
    endif
endfunction

function! ClimbToDirWhere(filename,chdir)
  let l:init_dir = getcwd()
  exec "lcd " . expand('%:p:h')
  while 1
    " Check if the file exists in the current directory
    if filereadable(a:filename)
      let l:result = getcwd()
      " Change directory if chdir==1
      if a:chdir !=# 1
        exec "lcd " . l:init_dir
      endif
      return l:result
    " If we've hit the top level directory, break out
    elseif getcwd() ==# "/" || getcwd() =~# '^[^/]..$'
      exec "lcd " . l:init_dir
      return -1
    else
      lcd ..
    endif
  endwhile
  exec "lcd " . l:init_dir
endfunction

function! GetProjDir()
    let l:proj_dir = ClimbToDirWhere("_proj_root",0)
    if ( l:proj_dir == -1 )
        let l:proj_dir = ClimbToDirWhere(".git/index",0)
    endif
    if ( l:proj_dir == -1 )
        let l:proj_dir = ClimbToDirWhere(".gitignore",0)
    endif
    if ( l:proj_dir == -1 )
        let l:proj_dir = ClimbToDirWhere("Makefile",0)
    endif
    if ( l:proj_dir == -1 )
        let l:proj_dir = expand('%:p:h')
    endif
    let b:proj_dir = l:proj_dir
endfunction

function! FocusBufOrDo(name,cmd)
    if buflisted(bufname(a:name))
        call FocusWindow(a:name)
        if bufname('%') != bufname(a:name)
            exec 'buffer ' . a:name
        endif
    elseif !empty(a:cmd)
        " echo 'No such buffer'
        exec a:cmd
    endif
endfunction

function! BufFocusedThenDo(name,cmd)
    if bufname('%') =~ a:name
        exec a:cmd
    else
        echo 'Not current buffer'
    endif
endfunction

function! FocusWindowOrDo(name,cmd)
    for b in getbufinfo()
        if b.name =~ a:name && !empty(b.windows)
            call win_gotoid(b.windows[0])
            return
        endif
    endfor
    echo 'Window not found'
    if !empty(a:cmd)
        exec a:cmd
    endif
endfunction

function! FocusWindow(name)
  for b in getbufinfo()
    if b.name =~ a:name && !empty(b.windows)
      call win_gotoid(b.windows[0])
      return
    endif
  endfor
endfunction

function! GotoTerm(arg)
  let cur = getbufinfo(expand('%'))[0].windows[0]
  let ar = []
  for b in getbufinfo()
    if b.name =~ '/bin/bash' && !empty(b.windows)
      let ar = ar + [b.windows[0]]
    endif
  endfor
  if len(ar) == 0
    " Should I create new window?
    if a:arg == 1
      wincmd n
    endif
    call FocusBufOrDo('/bin/bash','echo "No terminal found."')
    " call FocusBufOrDo('/bin/bash','echo "A new terminal!" | terminal ++curwin ++norestore')
    return
  endif
  " if ( exists("g:lasttermid") && (index(ar,cur)<0) )
  "   " echo 'remem' g:lasttermid
  "   call win_gotoid(g:lasttermid)
  "   return
  " endif
  call win_gotoid(ar[(1+index(ar,cur)) % len(ar)])
  " let g:lasttermid = getbufinfo(expand('%'))[0].windows[0]
endfunction

function! TerminalsFuneral()
    let bufmap = map(range(1, bufnr('$')), '[getbufvar((v:val), "&buftype"), v:val]')
    " echo bufmap
    let targ = filter(bufmap, 'v:val[0] =~ "terminal"')
    " echo targ
    for el in targ
        " echo el[1]
        " call term_setrestore(el[1],"++kill=term")
        call term_setkill(el[1],"term")
    endfor
endfunction

" echo map(range(1, bufnr('$')), '[bufname(v:val), v:val]')

" function! RevealBuf(arg)
"   let ar = []
"   for b in getbufinfo()
"     if b.name =~ a:arg && empty(b.windows) && b.loaded == 1
"       let a = b.bufnr
"       " echo b.bufnr
"       exec "sb" . (b.bufnr)
"     endif
"   endfor
" endfunction

function! RevealWindowOnTab(arg)
  let tabnum = tabpagenr()
  for bufnum in tabpagebuflist()
    if bufname(bufnum) =~ a:arg
      for buf in getbufinfo(bufnum)
        for bw in buf.windows
          if win_id2tabwin(bw)[0] == tabnum
            call win_gotoid(bw)
            return 1
          endif
        endfor
      endfor
    endif
  endfor
endfunction

function! RaiseNetRW()
    let r = RevealWindowOnTab("NetRWTreeListing")
    if r != 1
        exec "Vexplore"
    endif
endfunction

function! MoveToPrevTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() != 1
        close!
        if l:tab_nr == tabpagenr('$')
            tabprev
        endif
        sp
    else
        close!
        exe "0tabnew"
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() < tab_nr
        close!
        if l:tab_nr == tabpagenr('$')
            tabnext
        endif
        sp
    else
        close!
        tabnew
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
endfunc

" Swap content of 2 windows
function! SwapContentPrevWin()
    let lines1 = getline(1, '$')
    exe 'wincmd p'
    let lines2 = getline(1, '$')
    exe '%d_'
    $put=lines1
    normal ggdd
    exe 'wincmd p'
    exe '%d_'
    $put=lines2
    normal ggdd
endfunction

function! BufYank()
    let g:bufnra = bufnr("%")
endfunction

function! BufPut()
    exec "b" . g:bufnra
endfunction

function! WinSwap()
    " Swap current window with last used window
    let thiswin = winnr()
    let thisbuf = bufnr("%")
    let lastwin = winnr("#")
    let lastbuf = winbufnr(lastwin)
    exec lastwin . " wincmd w" ."|".
                \ "buffer ". thisbuf ."|".
                \ thiswin ." wincmd w" ."|".
                \ "buffer ". lastbuf
endfunction

function! SwitchBackground()
  if (&background == "light")
    exec "set background=dark"
  else
    exec "set background=light"
  endif
  " exec "set background"
  " echo &background
endfunction

function! SetPhase(...)
    " Discover what time of day it is by arg or by file-hint
    if ( a:0 > 0 )
        let g:phase = a:1
    elseif filereadable('/tmp/now_is_day')
        let g:phase = 'day'
    elseif filereadable('/tmp/now_is_nox')
        let g:phase = 'nox'
    elseif !exists("g:phase")
        let g:phase = 'dunno'
    endif
    " echom 'so phase is ' . g:phase
endfunction
function! SaveColor(...)
    if ( a:0 > 0 )
        let arg = a:1
    else
        let arg = g:phase
    endif
    if arg == 'day' || arg == 'dunno'
        echom "Saving colors for 'day'"
        let g:ColorDayName = g:colors_name
        let g:ColorDayLine = g:lightline.colorscheme
        let g:ColorDayBg = &background
    elseif arg == 'nox'
        echom "Saving colors for 'nox'"
        let g:ColorNoxName = g:colors_name
        let g:ColorNoxLine = g:lightline.colorscheme
        let g:ColorNoxBg = &background
    else
        echom "Please provide 'day' or 'nox'"
    endif
endfunction
function! LoadColor(...)
    if g:phase == 'dunno'
        echo "Will load default colors."
        unlet g:colors_name
        source $sh/vi/vimrc_themes
    elseif g:phase == 'day'
        if !exists("g:ColorDayName")
            echom "NO saved colors for this phase of day! Loading defaults.."
            if exists("g:colors_name") | unlet g:colors_name | endif
            source $sh/vi/vimrc_themes
            return
        else
            exec "colo " .           g:ColorDayName
            exec "LineColor " .      g:ColorDayLine
            exec "set background=" . g:ColorDayBg
        endif
    elseif g:phase == 'nox'
        if !exists("g:ColorNoxName")
            echom "NO saved colors for this phase of day! Loading defaults.."
            if exists("g:colors_name") | unlet g:colors_name | endif
            source $sh/vi/vimrc_themes
            return
        else
            exec "colo " .           g:ColorNoxName
            exec "LineColor " .      g:ColorNoxLine
            exec "set background=" . g:ColorNoxBg
        endif
    else
        echo "Unknown phase of day!"
    endif
endfunction
command! -nargs=? SaveColor call SetPhase(<f-args>) <bar> call SaveColor(<f-args>)
command! -nargs=? LoadColor call SetPhase(<f-args>) <bar> call LoadColor(<f-args>)

function! SwitchCE()
  if mapcheck("<C-e>") == ''
    noremap <C-e> 3<C-e>
    noremap <C-y> 3<C-y>
    echo "Now scrolling is faster."
  else
    unmap <C-e>
    try
      unmap <C-y>
    endtry
    echo "Now scrolling step is one line."
  endif
endfunc

function! LightlineReload(arg)
    " '1' to reload the current theme when you edit its file
    " '' to print name of current theme
    if a:arg != ''
        if a:arg == '1'
            source %
        else
            " let g:lightline = { 'colorscheme': a:arg, }
            let g:lightline = { 'colorscheme': a:arg }
        endif
    else
        echo g:lightline
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction
command! -nargs=? LineColor call LightlineReload('<args>')

function! DelSpace()
  let cur = line('.')
  " Search end of previous paragraph
  let beg = search('\S$\n\(^\s*$\n\)\+','bW')
  let beg = ( beg + 1 )
  exec (cur)
  " Search end of blank space after current paragraph
  let fin = search('\(^\s*$\n\)\+','eW')
  if fin == 0 | let fin = line('$') | endif
  " echom "fin" (fin)
  " echom (fin-beg)
  if (fin-beg+1) > 0
    silent exec (beg)','(fin)'d'
  endif
  if ( line(".") == line("$") )
    " end-of-file case
    exec "normal! o"
  else
    exec "normal! O"
  endif
endfunction

function! Parenthise()
  while ( line(".") != line("$") )
    if ( col('$') != 1 )
      normal 0i"
      normal A\n"
    endif
    normal j
  endwhile
endfunction

function! DoOnKey(keycode,command)
  let l:key = getchar()
  " echom l:key
  if ( l:key == a:keycode )
    exec a:command
  endif
endfunction

function! EvalThis()
    " echom "beginin"
  if getline(line('.')) =~ "^$"
    " If cursor is on a blank line, Eval next paragraph
    exec "normal! yap:@\"\<CR>"
    " echom "whole par"
  else
    " Eval current line
    " echom "one line"
    if getline(line('.')) =~ '^\%[\s]*["].*'
      " Ignore the comment sign <"> if it was detected
      exec "normal! 0^wy$:@\"\<CR>"
    else
      exec "normal! yy:@\"\<CR>"
    endif
  endif
endfunction

" Exec command with output to current buffer
function! ExPut(cmd)
  redir => message
  silent exec a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
   " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    " tabnew
    " setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command ExPut call ExPut(<q-args>)

" Delete buffer and load previous buffer, or just any other
function! BDnJump()
    "" if ( ( expand('#') == '' ) || ( expand('#') =~ '!/bin/bash' ) ) "" if ( expand('%') =~ '!/bin/bash' ) && ( expand('%') == expand('#') ) """ Current and prev buffers are terminals
    if ( bufexists(bufnr('#')) ) " Previous buffer is unset
        let l:cbn = bufnr('%')
        bnext " Jump to any other buffer
        exec  'bd!' . l:cbn
    else
        let l:cbn = bufnr('%')
        b # " Jump to the previous buffer
        exec  'bd!' . l:cbn
    endif
endfunction
command! BDnJump call BDnJump()

function! SortParagraphs() range
  exec a:firstline . "," . a:lastline . 'd'
  let @@=join(sort(split(substitute(@@, "\n*$", '', ''), "\n\n")), "\n\n")
  put!
endfunction

function! FoldMotion(type)
  if a:type == 'line'
    let l:line=&commentstring[0] . "------------------------------"
    let l:foldbeg=split(&foldmarker,",")[0]
    let l:foldend=split(&foldmarker,",")[1]
    let l:start=getpos("'[")[-3]
    let l:finish=getpos("']")[-3]
    exec l:finish
    put  =l:line . l:foldend
    exec l:start
    put! =l:line . l:foldbeg
  endif
endfunction

function! FoldSelection()
let l:line=&commentstring[0] . "------------------------------"
let l:foldbeg=split(&foldmarker,",")[0]
let l:foldend=split(&foldmarker,",")[1]
  silent exec "normal `>"
  silent put  =l:line . l:foldend
  silent exec "normal `<"
  silent put! =l:line . l:foldbeg
endfunction

function! SystemOpenEveryLine()
  silent exec "normal `>"
  let l:end = line('.')
  silent exec "normal `<"
  let l:beg = line('.')
  for lineno in range(l:beg, l:end)
    let l:line = getline(lineno)
    " Open l:line with its xdg program
    silent call system('xdg-open ' . "'" . l:line . "' &>/dev/null &")
  endfor
  " Restore selection
  exec "normal `>V`<"
endfunction

function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction

" FZF
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction
function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction
command! BufD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
"
let $FZF_DEFAULT_OPTS='--exact --layout=reverse'
"
function! Delete_buffers()
  let l:preview_window = get(g:, 'fzf_preview_window', &columns >= 120 ? 'right': '')
  let l:options = [
        \   '-m',
        \   '--tiebreak=index',
        \   '-d', '\t',
        \   '--prompt', 'Delete> '
        \ ]
  if len(l:preview_window)
    let l:options = extend(l:options, get(fzf#vim#with_preview(
          \   {"placeholder": "{2}"},
          \   l:preview_window
          \ ), 'options', []))
  endif
  return fzf#run(fzf#wrap({
        \ 'source':  map(
        \   filter(
        \     range(1, bufnr('$')),
        \     {_, nr -> buflisted(nr) && !getbufvar(nr, "&modified")}
        \   ),
        \   {_, nr -> s:format_buffer(nr)}
        \ ),
        \ 'sink*': {
        \   lines -> execute('bdelete ' . join(map(lines, {
        \     _, line -> substitute(split(line)[0], '^\[\|\]$', '', 'g')
        \   })), 'silent!')
        \ },
        \ 'options': l:options,
        \}))
endfunction
function! s:format_buffer(b)
  let l:name = bufname(a:b)
  let l:name = empty(l:name) ? '[No Name]' : fnamemodify(l:name, ":p:~:.")
  let l:flag = a:b == bufnr('')  ? '%' :
        \ (a:b == bufnr('#') ? '#' : ' ')
  let l:modified = getbufvar(a:b, '&modified') ? ' [+]' : ''
  let l:readonly = getbufvar(a:b, '&modifiable') ? '' : ' [RO]'
  let l:extra = join(filter([l:modified, l:readonly], '!empty(v:val)'), '')
  return substitute(printf("[%s] %s\t%s\t%s", a:b, l:flag, l:name, l:extra), '^\s*\|\s*$', '', 'g')
endfunction

""""""""""""""""""""""""
""       WTF...       ""
""""""""""""""""""""""""

" " Highlight lines via signs functionality
" function! MySigns()
"   highlight myboo ctermbg=3 ctermfg=0
"   highlight mywar ctermbg=1 ctermfg=0
"   sign define mybookmark text=>> linehl=myboo texthl=myboo
"   sign define mywarning  text=!> linehl=mywar texthl=mywar
"   nnoremap <F8> :exe ":sign place 777 line=" . line(".") ." name=mywarning file=" . expand("%:p")<CR>
"   nnoremap <F9> :exe ":sign place 666 line=" . line(".") ." name=mybookmark file=" . expand("%:p")<CR>
"   nnoremap <F10> :sign unplace<CR>
"   if filereadable("$RTP/signs.sav")
"     source $RTP/signs.sav
"   endif
" endfunc
" call MySigns()

" Remember folds ??
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
" "Powerline
" let $PYTHONPATH='/usr/lib/python3.6/site-packages'
" set laststatus=2
" let g:Powerline_symbols = "fancy"
" let g:LustyExplorerSuppressRubyWarning = 1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" augroup mysettings
" au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab
" augroup END

" for vim-bookmarks
let g:bookmark_no_default_key_mappings = 0
nmap mm <Plug>BookmarkToggle
nmap m<Space> <Plug>BookmarkAnnotate
nmap m<bar> <Plug>BookmarkShowAll
nmap m<Down> <Plug>BookmarkNext
nmap m<Up> <Plug>BookmarkPrev

let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" Highlight all ExtraWhitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

if has('nvim')
    set wildoptions=pum
    set pumblend=15
    set winblend=10
    autocmd TermOpen * setlocal scrollback=-1
endif

" Watch log with Vim " For Neovim use :terminal
" call job_start("tail -f /ln/ho/iLog", {'out_io':'buffer','out_name':'dummy'})

nnoremap <silent><A-;> <Cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <silent><A-;> <C-\><C-n>:ToggleTermToggleAll<CR>

