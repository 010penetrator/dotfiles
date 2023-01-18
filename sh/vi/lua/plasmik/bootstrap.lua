-- vim: ts=2 sw=2

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--[[ -- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  0
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd "packadd packer.nvim"
end ]]

require("lazy").setup({

  -- Basic
  'itchyny/lightline.vim', --cool
  'justinmk/vim-sneak', --good!
  'jlanzarotta/bufexplorer', --basic
  -- 'tpope/vim-sensible', --basic
  -- 'tpope/vim-commentary',
  -- 'tpope/vim-vinegar', --basic
  'tpope/vim-surround', --good
  'tpope/vim-endwise', --okay
  'tpope/vim-repeat', --handy
  'tpope/vim-eunuch', --handy
  -- 'tpope/vim-ragtag', --ok
  'tpope/vim-fugitive', --handy
  'mhinz/vim-startify',
  -- 'sheerun/vim-polyglot', --okay HUGE
  'airblade/vim-gitgutter',
  -- 'michaeljsmith/vim-indent-object', --cool
  'godlygeek/tabular', --okay
  'jamessan/vim-gnupg', --good
  -- 'chrisbra/Colorizer', --good
  'junegunn/goyo.vim', --usable
  'haya14busa/vim-edgemotion', --good
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }, --fantastic

  -- Try out now
  -- 'zefei/vim-colortuner', --fun
  -- 'Townk/vim-autoclose', --usable
  'MattesGroeger/vim-bookmarks',
  'will133/vim-dirdiff',
  -- 'tpope/vim-sleuth',

  -- Try out later
  -- 'tpope/vim-unimpaired',
  -- 'ZeroKnight/vim-signjump', --buggy
  -- 'kien/rainbow_parentheses.vim',
  -- 'craigemery/vim-autotag', --errors
  -- 'hari-rangarajan/CCTree',
  -- 'honza/vim-snippets',
  -- 'vim-scripts/QuickBuf',
  -- 'ludovicchabant/vim-gutentags',
  -- 'liuchengxu/vista.vim',
  -- 'derekwyatt/vim-fswitch',
  -- 'RRethy/vim-illuminate'

  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-lint',
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'nvim-telescope/telescope-dap.nvim',
  { 'nvim-treesitter/nvim-treesitter', config = function() vim.cmd("TSUpdate") end, },
  'mrjones2014/nvim-ts-rainbow',
  'ziontee113/syntax-tree-surfer',
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'VonHeikemen/lsp-zero.nvim',
  -- 'glepnir/lspsaga.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'chentoast/marks.nvim', -- okay
  'norcalli/nvim-colorizer.lua',
  -- 'kwkarlwang/bufjump.nvim',
  'nvim-neo-tree/neo-tree.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
  'lambdalisue/suda.vim',
  'numToStr/Comment.nvim',
  'karb94/neoscroll.nvim',
  'akinsho/toggleterm.nvim',
  'windwp/nvim-autopairs',
  -- 'lukas-reineke/indent-blankline.nvim',
  'booperlv/nvim-gomove',
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  { 'https://github.com/ggandor/leap.nvim',
config = function() require('leap').add_default_mappings(true) end, },

------------------------
--      Themes:       --
------------------{{{}}}

  'lukas-reineke/onedark.nvim',
  { 'folke/tokyonight.nvim', branch = 'main' },
  'projekt0n/github-nvim-theme',
  'savq/melange-nvim',
  'Yazeed1s/minimal.nvim',

  -- 'morhetz/gruvbox', --best
  'sainnhe/gruvbox-material', --improved
  '010penetrator/vim-colors-forplasma', --collection
  'ajmwagar/vim-dues', --soft coffee 'deus
  'chriskempson/vim-tomorrow-theme', --Nice dark+light
  'nanotech/jellybeans.vim', --good4html
  'mhartington/oceanic-next', --soft nice
  'w0ng/vim-hybrid', --beautiful
  'kristijanhusak/vim-hybrid-material', --nice Sane dark
  'severij/vadelma', --white good-con
  'https://gitlab.com/protesilaos/tempus-themes-vim.git',
  -- 'jacoborus/tender.vim', --sane soft dark
  'cocopon/iceberg.vim', --soft cold dark
  'AlessandroYorba/Alduin', --brown lowcon
  'jonathanfilip/vim-lucius', --day morning
  'rose-pine/neovim', --fancy dark
  'romainl/Apprentice', --nostrain
  { 'catppuccin/vim', name = 'catppuccin' },
  'JarrodCTaylor/spartan', -- 'spartan,immortals
  'pbrisbin/vim-colors-off',
  'jakwings/vim-colors', --'moody,garden,messy
  'bf4/vim-dark_eyes', --NIGHT
  'MPiccinato/wombat256', --good dark
  { 'sonph/onehalf', config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end }, --Nice good tone HUGE
  'ajh17/Spacegray.vim', --darker misty
  'beigebrucewayne/Turtles', --funky
  'vim-scripts/sift', --underwater_fantasy
  'vim-scripts/C64.vim', --joke
  'szorfein/fantasy.vim', --dull
  'KimNorgaard/vim-frign', --borland_style
  'vim-scripts/Gummybears', --very_dark
  'KKPMW/sacredforest-vim', --lowcont
  'logico-dev/typewriter', --good!
  'wimstefan/vim-artesanal', --good lowcon gray
  -- 'AlessandroYorba/Sierra', --softgray
  -- 'AlessandroYorba/Despacio', --softdarkgrey
  -- 'HenryNewcomer/vim-theme-underflow', --consbroken
  'beigebrucewayne/min_solo', --grey bg subtle__
  'junegunn/seoul256.vim', --okay
  'arzg/vim-mayanfog', --light
  'arzg/vim-plan9', --trueeeee
  'lithammer/vim-eighties', --trueeeee
  'arzg/vim-substrata', --cold neon
  'sainnhe/edge', --good soft
  'sainnhe/everforest', --cream lowcon
  'sainnhe/archived-colors', --atlantis,cryslominsa,desert_night,fairy_garden,grimoire,ice_age,lost_shrine,vanilla_cake
  'flrnd/plastic.vim', --solid dark
  'EdenEast/nightfox.nvim', --fashy dark
  'colepeters/spacemacs-theme.vim', --cool
  'relastle/bluewery.vim', --low-con
  'markeganfuller/vim-journeyman', --pale dark
  'stillwwater/vim-nebula', --cold dark
  'franbach/miramare', --coffee dark
  -- 'dracula/vim', --funky
  -- 'jlund3/colorschemer', --semibroken 'lucid
  -- 'srcery-colors/srcery-vim', --fresh-dark consbroken HUGE
  -- 'dfrunza/vim', --borland,muratori,pencil,vc6
  -- 'zefei/cake16', --cool medium
  -- 'machakann/vim-colorscheme-tatami', --fun green
  -- 'RussellBradley/vim-knicks' --great blue 404
  -- 'aradunovic/perun.vim', --consbroken 404
  -- 'the31k/vim-colors-tayra', --Nice gray 404
  -- 'koirand/tokyo-metro.vim', --pretty dark
  -- 'nightsense/rusticated', --morning
  -- 'nightsense/snow', --soft)
  -- 'nightsense/stellarized', --nice! light+dark
  ---- Pretty but not comfortable :
  -- 'sainnhe/sonokai', --dark gui&nogui
  -- 'szorfein/fromthehell.vim', --dark satur earth
  -- 'whatyouhide/vim-gotham', --neon/green
  -- 'yuttie/inkstained-vim', --very low con light
  -- 'ayu-theme/ayu-vim',
  -- 'atelierbram/vim-colors_atelier-schemes', --mindfuck
  -- 'bcicen/vim-vice', --joke
  -- 'vim-scripts/swamplight', --day
})

