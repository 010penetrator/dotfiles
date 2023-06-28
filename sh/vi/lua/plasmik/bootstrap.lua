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

  -- VIM BASIC --
  --------------------------------------
  -- 'itchyny/lightline.vim', -- cool
  'justinmk/vim-sneak', -- good!
  'jlanzarotta/bufexplorer', -- basic
  -- 'tpope/vim-sensible', -- basic
  -- 'tpope/vim-commentary',
  -- 'tpope/vim-vinegar', -- basic
  -- 'tpope/vim-surround', -- good
  -- 'tpope/vim-endwise', -- okay
  'tpope/vim-repeat', -- handy
  'tpope/vim-eunuch', -- handy
  -- 'tpope/vim-ragtag', -- ok
  'tpope/vim-fugitive', -- handy
  'mhinz/vim-startify',
  -- 'sheerun/vim-polyglot', -- okay HUGE
  -- 'airblade/vim-gitgutter',
  -- 'michaeljsmith/vim-indent-object', -- cool
  -- 'godlygeek/tabular', -- okay
  'junegunn/vim-easy-align',
  'jamessan/vim-gnupg', -- good
  -- 'chrisbra/Colorizer', -- good
  -- 'junegunn/goyo.vim', -- usable
  'MattesGroeger/vim-bookmarks', -- great
  'haya14busa/vim-edgemotion', -- great -- Use with <C-j>
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }, -- fantastic

  -- TRY LATER --
  -- 'zefei/vim-colortuner', -- fun
  -- 'Townk/vim-autoclose', -- usable
  'will133/vim-dirdiff',
  -- 'tpope/vim-sleuth',
  -- 'RRethy/vim-illuminate', -- no effect
  -- 'ZeroKnight/vim-signjump', -- buggy
  -- 'vim-scripts/QuickBuf',
  -- 'liuchengxu/vista.vim',
  -- 'derekwyatt/vim-fswitch',
  -- 'tpope/vim-unimpaired',
  'dkarter/bullets.vim',
  -- 'honza/vim-snippets',

  -- NEOVIM ONLY -- {{{}}}
  --------------------------------------
  {'nvim-lualine/lualine.nvim', dependencies = 'kyazdani42/nvim-web-devicons'},
  { 'akinsho/bufferline.nvim', version='v3.*', dependencies='kyazdani42/nvim-web-devicons' },
  'kylechui/nvim-surround', -- okay -- TPope classics remake
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-lint', -- todo
  'mfussenegger/nvim-dap', -- todo
  'rcarriga/nvim-dap-ui',
  'nvim-telescope/telescope-dap.nvim',
  { 'nvim-treesitter/nvim-treesitter', config = function() vim.cmd("silent TSUpdate") end, },
  'mrjones2014/nvim-ts-rainbow', -- buggy
  { 'neovim/nvim-lspconfig',
    dependencies = {
        {
            'SmiteshP/nvim-navbuddy',
            dependencies = {
                'SmiteshP/nvim-navic',
                'MunifTanjim/nui.nvim'
            },
            opts = { lsp = { auto_attach = true } }
        }
    },
  },
  'williamboman/mason.nvim', -- good -- load TS servers
  'williamboman/mason-lspconfig.nvim',
  'VonHeikemen/lsp-zero.nvim', -- todo
  -- 'glepnir/lspsaga.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  -- 'amarakon/nvim-cmp-buffer-lines', -- todo
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'chentoast/marks.nvim', -- good -- better marks
  'lambdalisue/suda.vim', -- perfect -- Sudo file operations
  { 'nvim-neo-tree/neo-tree.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' } }, -- cool
  'numToStr/Comment.nvim', -- good -- hit 'gcc' to comment
  'akinsho/toggleterm.nvim', -- cool
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim', -- cool
  'lukas-reineke/indent-blankline.nvim', -- usable
  'powerman/vim-plugin-ruscmd', -- works
  'norcalli/nvim-colorizer.lua',
  'levouh/tint.nvim', -- okay -- Fade inactive windows
  'andrewferrier/debugprint.nvim', -- good
  'declancm/cinnamon.nvim', -- usable -- Smooth scroll
  -- 'karb94/neoscroll.nvim', -- maybe
  -- 'LukasPietzschmann/telescope-tabs', -- usable
  'booperlv/nvim-gomove', -- works
  'kwkarlwang/bufjump.nvim', -- good
  'sindrets/diffview.nvim', -- great
  'simrat39/symbols-outline.nvim', -- okay
  'gennaro-tedesco/nvim-peekup', -- usage:""
  -- 'trmckay/based.nvim', -- no effect
  -- { 'utilyre/barbecue.nvim', dependencies = { 'SmiteshP/nvim-navic' } }, -- maybe
  'petertriho/nvim-scrollbar', -- okay
  'Wansmer/treesj',
  -- 'nyngwang/murmur.lua', -- no effect
  'tamton-aquib/zone.nvim', -- fun

  -- TRIAL --
  'gorbit99/codewindow.nvim', -- ... -- minimap
  'rareitems/hl_match_area.nvim',
  'Eandrju/cellular-automaton.nvim',
-- https://roobert.github.io/2022/12/03/Extending-Neovim/
  'nullchilly/fsread.nvim',
  'folke/paint.nvim',
  'folke/styler.nvim',
  -- 'LintaoAmons/scratch.nvim',
  'AbdelrahmanDwedar/awesome-nvim-colorschemes',
  'Yazeed1s/oh-lucy.nvim',
  'diegoulloao/nvim-file-location',
  'lewis6991/satellite.nvim',
  { 'AckslD/nvim-trevJ.lua', config = 'require("trevj").setup()' },
  -- { 'j-hui/fidget.nvim', tag = 'legacy' }, -- silly warning
  'cbochs/portal.nvim',
  'ziontee113/neo-minimap',
  'princejoogie/dir-telescope.nvim',
  -- 'pocco81/true-zen.nvim',
  'lewis6991/gitsigns.nvim',
  'windwp/nvim-autopairs',
  'm4xshen/autoclose.nvim',
  'folke/flash.nvim',
  -- 'SmiteshP/nvim-navbuddy', -- look up!

  -- try later -- {{{}}}
  'ziontee113/syntax-tree-surfer',
  'AckslD/nvim-neoclip.lua', -- no effect
  'mizlan/iswap.nvim',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  -- 'ggandor/leap.nvim', -- suxx
  -- 'haolian9/reveal.nvim', -- no effect
  -- 'Dax89/ide.nvim', -- maybe
  -- 'mrjones2014/legendary.nvim',
  -- 'folke/which-key.nvim',
  -- 'gaoDean/autolist.nvim', -- no effect
  -- 'marcuscaisey/olddirs.nvim', --promising
  'prochri/telescope-all-recent.nvim',
  -- 'CKolkey/ts-node-action',
  'smzm/hydrovim',
  'luukvbaal/statuscol.nvim', --ambitious
  -- 'Wansmer/sibling-swap.nvim',
  'RaafatTurki/hex.nvim',
  'JoosepAlviste/palenightfall.nvim',
  -- 'danielfalk/smart-open.nvim', --funky telescope mode
  'tsakirist/telescope-lazy.nvim',

------------------------
--      Themes:       --
------------------{{{}}}

  'gbprod/nord.nvim',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'kvrohit/mellow.nvim',
  'sam4llis/nvim-tundra', -- needs lua require()
  'katawful/kat.nvim',
  'Tsuzat/NeoSolarized.nvim',
  { 'AlexvZyl/nordic.nvim', lazy = false, priority = 1000 }, -- beautiful
  'rebelot/kanagawa.nvim',
  'lukas-reineke/onedark.nvim',
  { 'folke/tokyonight.nvim', branch = 'main' },
  'projekt0n/github-nvim-theme',
  'savq/melange-nvim',
  'Yazeed1s/minimal.nvim',

  -- 'morhetz/gruvbox', -- best
  'sainnhe/gruvbox-material', -- improved
  '010penetrator/vim-colors-forplasma', -- collection
  'chriskempson/vim-tomorrow-theme', -- Nice dark+light
  'w0ng/vim-hybrid', -- beautiful
  'kristijanhusak/vim-hybrid-material', -- nice Sane dark
  'severij/vadelma', -- white good-con
  'https://gitlab.com/protesilaos/tempus-themes-vim.git',
  'cocopon/iceberg.vim', -- soft cold dark
  'AlessandroYorba/Alduin', -- brown lowcon
  'jonathanfilip/vim-lucius', -- day morning
  'rose-pine/neovim', -- fancy dark
  'romainl/Apprentice', -- nostrain
  'JarrodCTaylor/spartan', -- 'spartan,immortals
  'pbrisbin/vim-colors-off',
  'jakwings/vim-colors', -- 'moody,garden,messy
  'bf4/vim-dark_eyes', -- NIGHT
  { 'sonph/onehalf', config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end }, -- Nice good tone HUGE
  'beigebrucewayne/Turtles', -- funky
  'vim-scripts/C64.vim', -- joke
  'szorfein/fantasy.vim', -- dull
  'KimNorgaard/vim-frign', -- borland_style
  'KKPMW/sacredforest-vim', -- lowcont
  'logico-dev/typewriter', -- good!
  'wimstefan/vim-artesanal', -- good lowcon gray
  'beigebrucewayne/min_solo', -- grey bg subtle__
  'lithammer/vim-eighties', -- trueeeee
  'arzg/vim-substrata', -- cold neon
  'sainnhe/edge', -- good soft
  'sainnhe/everforest', -- cream lowcon
  'sainnhe/archived-colors', -- atlantis,cryslominsa,desert_night,fairy_garden,grimoire,ice_age,lost_shrine,vanilla_cake
  'flrnd/plastic.vim', -- solid dark
  'EdenEast/nightfox.nvim', -- fashy dark
  'colepeters/spacemacs-theme.vim', -- cool
  'relastle/bluewery.vim', -- low-con
  'stillwwater/vim-nebula', -- cold dark
  'franbach/miramare', -- coffee dark
  'mhartington/oceanic-next', -- soft nice
  -- 'nanotech/jellybeans.vim', -- good4html
  -- 'HenryNewcomer/vim-theme-underflow', -- consbroken
  -- 'jacoborus/tender.vim', -- sane soft dark
  -- 'AlessandroYorba/Sierra', -- softgray
  -- 'AlessandroYorba/Despacio', -- softdarkgrey
  -- 'dracula/vim', -- funky
  -- 'ajh17/Spacegray.vim', -- darker fruity
  -- 'jlund3/colorschemer', -- semibroken 'lucid
  -- 'srcery-colors/srcery-vim', -- fresh-dark consbroken HUGE
  -- 'dfrunza/vim', -- borland,muratori,pencil,vc6
  -- 'zefei/cake16', -- cool medium
  -- 'machakann/vim-colorscheme-tatami', -- fun green
  -- 'RussellBradley/vim-knicks' -- great blue 404
  -- 'aradunovic/perun.vim', -- consbroken 404
  -- 'the31k/vim-colors-tayra', -- Nice gray 404
  -- 'koirand/tokyo-metro.vim', -- pretty dark
  -- 'nightsense/rusticated', -- morning
  -- 'ajmwagar/vim-dues', -- soft coffee 'deus
  -- 'nightsense/snow', -- soft)
  -- 'nightsense/stellarized', -- nice! light+dark
  -- 'arzg/vim-mayanfog', -- light bone
  -- 'arzg/vim-plan9', -- trueeeee
  ---- Pretty but not useful ----
  -- 'sainnhe/sonokai', -- dark gui&nogui
  -- 'szorfein/fromthehell.vim', -- dark satur earth
  -- 'whatyouhide/vim-gotham', -- neon/green
  -- 'yuttie/inkstained-vim', -- very low con light
  'ayu-theme/ayu-vim',
  -- 'atelierbram/vim-colors_atelier-schemes', -- mindfuck
  -- 'bcicen/vim-vice', -- joke
  -- 'vim-scripts/swamplight', -- day
},
{
  root = vim.env.PLUGD,
}
)

