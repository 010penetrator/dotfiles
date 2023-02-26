-- vim: ts=2 sw=2
-- Install plugins manager and install plugins

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- local lazypath = vim.env.PLUGD .. "/lazy/lazy.nvim"
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
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd "packadd packer.nvim"
end ]]

require("lazy").setup({

  -- Basic
  -- 'itchyny/lightline.vim', --cool
  {'nvim-lualine/lualine.nvim', dependencies = 'kyazdani42/nvim-web-devicons'},
  'justinmk/vim-sneak', --good!
  'jlanzarotta/bufexplorer', --basic
  -- 'tpope/vim-sensible', --basic
  -- 'tpope/vim-commentary',
  -- 'tpope/vim-vinegar', --basic
  -- 'tpope/vim-surround', --good
   'kylechui/nvim-surround',
  -- 'tpope/vim-endwise', --okay
  'tpope/vim-repeat', --handy
  'tpope/vim-eunuch', --handy
  -- 'tpope/vim-ragtag', --ok
  'tpope/vim-fugitive', --handy
  'mhinz/vim-startify',
  -- 'sheerun/vim-polyglot', --okay HUGE
  -- 'airblade/vim-gitgutter',
  'lewis6991/gitsigns.nvim',
  -- 'michaeljsmith/vim-indent-object', --cool
  -- 'godlygeek/tabular', --okay
  'junegunn/vim-easy-align',
  'jamessan/vim-gnupg', --good
  -- 'chrisbra/Colorizer', --good
  -- 'junegunn/goyo.vim', --usable
  -- 'Pocco81/true-zen.nvim',
  'haya14busa/vim-edgemotion', --good
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }, --fantastic

  -- Try now
  -- 'zefei/vim-colortuner', --fun
  -- 'Townk/vim-autoclose', --usable
  'MattesGroeger/vim-bookmarks',
  'will133/vim-dirdiff',
  -- 'tpope/vim-sleuth',

  -- 'tpope/vim-unimpaired',
  'windwp/nvim-autopairs',
  -- 'gaoDean/autolist.nvim', -- no effect
  'dkarter/bullets.vim',

  -- 'RRethy/vim-illuminate', -- no effect

  'nvim-neo-tree/neo-tree.nvim',
  'simrat39/symbols-outline.nvim',

  -- 'ZeroKnight/vim-signjump', --buggy
  -- 'vim-scripts/QuickBuf',
  -- 'liuchengxu/vista.vim',
  -- 'derekwyatt/vim-fswitch',

  -- 'honza/vim-snippets',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-lint',
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'nvim-telescope/telescope-dap.nvim',
  { 'nvim-treesitter/nvim-treesitter', config = function() vim.cmd("silent TSUpdate") end, },
  'mrjones2014/nvim-ts-rainbow',
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
  'chentoast/marks.nvim', -- okay
  'norcalli/nvim-colorizer.lua',
  -- 'kwkarlwang/bufjump.nvim',
  'MunifTanjim/nui.nvim',
  'lambdalisue/suda.vim',
  'numToStr/Comment.nvim',
  'akinsho/toggleterm.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'booperlv/nvim-gomove',
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  'powerman/vim-plugin-ruscmd',
  { 'akinsho/bufferline.nvim', version='v3.*', dependencies='kyazdani42/nvim-web-devicons' },
  'sindrets/diffview.nvim',
  -- 'kyazdani42/nvim-web-devicons',
  -- 'echasnovski/mini.nvim',

  'declancm/cinnamon.nvim',
  -- 'karb94/neoscroll.nvim',
  'mizlan/iswap.nvim',
  'andrewferrier/debugprint.nvim',
  -- 'https://github.com/ggandor/leap.nvim',
  'ziontee113/syntax-tree-surfer',

  'levouh/tint.nvim',
  'gennaro-tedesco/nvim-peekup',

  'SmiteshP/nvim-navic',
  'utilyre/barbecue.nvim',

  'LukasPietzschmann/telescope-tabs',
  'gorbit99/codewindow.nvim',
  'haolian9/reveal.nvim',
  'nagy135/typebreak.nvim',
  'amarakon/nvim-cmp-buffer-lines',
  -- 'rcarriga/nvim-notify',
  -- 'folke/noice.nvim',
  'AckslD/nvim-neoclip.lua',

------------------------
--      Themes:       --
------------------{{{}}}

  'kvrohit/mellow.nvim',
  'sam4llis/nvim-tundra', -- needs lua require()
  'katawful/kat.nvim',
  'Tsuzat/NeoSolarized.nvim',

  'lukas-reineke/onedark.nvim',
  { 'folke/tokyonight.nvim', branch = 'main' },
  'projekt0n/github-nvim-theme',
  'savq/melange-nvim',
  'Yazeed1s/minimal.nvim',

  -- 'morhetz/gruvbox', --best
  'sainnhe/gruvbox-material', --improved
  '010penetrator/vim-colors-forplasma', --collection
  'chriskempson/vim-tomorrow-theme', --Nice dark+light
  'w0ng/vim-hybrid', --beautiful
  'kristijanhusak/vim-hybrid-material', --nice Sane dark
  'severij/vadelma', --white good-con
  'https://gitlab.com/protesilaos/tempus-themes-vim.git',
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
  { 'sonph/onehalf', config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end }, --Nice good tone HUGE
  'beigebrucewayne/Turtles', --funky
  'vim-scripts/C64.vim', --joke
  'szorfein/fantasy.vim', --dull
  'KimNorgaard/vim-frign', --borland_style
  'KKPMW/sacredforest-vim', --lowcont
  'logico-dev/typewriter', --good!
  'wimstefan/vim-artesanal', --good lowcon gray
  'beigebrucewayne/min_solo', --grey bg subtle__
  'lithammer/vim-eighties', --trueeeee
  'arzg/vim-substrata', --cold neon
  'sainnhe/edge', --good soft
  'sainnhe/everforest', --cream lowcon
  'sainnhe/archived-colors', --atlantis,cryslominsa,desert_night,fairy_garden,grimoire,ice_age,lost_shrine,vanilla_cake
  'flrnd/plastic.vim', --solid dark
  'EdenEast/nightfox.nvim', --fashy dark
  'colepeters/spacemacs-theme.vim', --cool
  'relastle/bluewery.vim', --low-con
  'stillwwater/vim-nebula', --cold dark
  'franbach/miramare', --coffee dark
  'mhartington/oceanic-next', --soft nice
  -- 'nanotech/jellybeans.vim', --good4html
  -- 'HenryNewcomer/vim-theme-underflow', --consbroken
  -- 'jacoborus/tender.vim', --sane soft dark
  -- 'AlessandroYorba/Sierra', --softgray
  -- 'AlessandroYorba/Despacio', --softdarkgrey
  -- 'dracula/vim', --funky
  -- 'ajh17/Spacegray.vim', --darker fruity
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
  -- 'ajmwagar/vim-dues', --soft coffee 'deus
  -- 'nightsense/snow', --soft)
  -- 'nightsense/stellarized', --nice! light+dark
  -- 'arzg/vim-mayanfog', --light bone
  -- 'arzg/vim-plan9', --trueeeee
  ---- Pretty but not useful ----
  -- 'sainnhe/sonokai', --dark gui&nogui
  -- 'szorfein/fromthehell.vim', --dark satur earth
  -- 'whatyouhide/vim-gotham', --neon/green
  -- 'yuttie/inkstained-vim', --very low con light
  'ayu-theme/ayu-vim',
  -- 'atelierbram/vim-colors_atelier-schemes', --mindfuck
  -- 'bcicen/vim-vice', --joke
  -- 'vim-scripts/swamplight', --day
},
{
  root = vim.env.PLUGD,
}
)

