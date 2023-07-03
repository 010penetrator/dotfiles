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

--[[ -- Install packer --
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd "packadd packer.nvim"
end ]]

require("lazy").setup( {

  -- VIM BASIC --
  ------------------------{{{}}}
  -- 'itchyny/lightline.vim', -- cool
  -- 'justinmk/vim-sneak', -- good!
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

  -- TRIAL --
  -- 'zefei/vim-colortuner', -- fun
  -- 'Townk/vim-autoclose', -- usable
  'will133/vim-dirdiff',
  -- 'tpope/vim-sleuth',
  -- 'ZeroKnight/vim-signjump', -- buggy
  -- 'vim-scripts/QuickBuf',
  -- 'liuchengxu/vista.vim',
  -- 'derekwyatt/vim-fswitch',
  -- 'tpope/vim-unimpaired',
  'dkarter/bullets.vim',
  -- 'honza/vim-snippets',

  -- NEOVIM ONLY --
  ------------------------{{{}}}

  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'nvim-lua/plenary.nvim',
  'williamboman/mason.nvim', -- base -- load TS servers
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-lint',
  'jay-babu/mason-nvim-dap.nvim',
  'rcarriga/nvim-dap-ui',
  'nvim-telescope/telescope-dap.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd("silent TSUpdate")
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'SmiteshP/nvim-navbuddy',
        dependencies = {
            'SmiteshP/nvim-navic', -- config soon!
            'MunifTanjim/nui.nvim'
        },
        opts = { lsp = { auto_attach = true } }
      }
    },
  },
  'williamboman/mason-lspconfig.nvim',
  'VonHeikemen/lsp-zero.nvim', -- todo
  'amarakon/nvim-cmp-buffer-lines', -- todo
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    -- config = function()
    --   require("your.null-ls.config") -- require your null-ls config here (example below)
    -- end,
  },

  -- 'mrjones2014/nvim-ts-rainbow', -- buggy
  'https://gitlab.com/HiPhish/nvim-ts-rainbow2',
  'chentoast/marks.nvim', -- good -- better marks
  'lambdalisue/suda.vim', -- perfect -- Sudo file operations
  'declancm/cinnamon.nvim', -- usable -- Smooth scroll
  -- 'karb94/neoscroll.nvim', -- maybe

  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = {
      options = {
        section_separators = '',
        component_separators = '',
        theme = 'nord',
      },
    },
    config = true,
  },

  {
    'akinsho/bufferline.nvim',
    version='v3.*',
    dependencies='kyazdani42/nvim-web-devicons',
    opts = {
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        }
      }
    }
  },

  -- 'windwp/nvim-autopairs',
  -- {
  --   'm4xshen/autoclose.nvim',
  --   config = true
  -- },
  {
    'kylechui/nvim-surround', -- okay -- TPope classics remake
    config = true
  },

  {
    'nvim-neo-tree/neo-tree.nvim', -- almost great
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
        -- "open_current",
        -- "disabled",
      }
    }
  },

  {
    'numToStr/Comment.nvim', -- good -- hit 'gcc' to comment
    config = true
  },

  {
    'akinsho/toggleterm.nvim', -- cool -- fast terminal
    opts = {
      -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
      direction = 'horizontal',
      start_in_insert = true,
      size = 24,
      -- persist_size = false,
      -- persist_mode = true,
    },
  },

  'https://git.sr.ht/~whynothugo/lsp_lines.nvim', -- cool
  'lukas-reineke/indent-blankline.nvim', -- usable
  'powerman/vim-plugin-ruscmd', -- works
  'norcalli/nvim-colorizer.lua',

  {
    'levouh/tint.nvim', -- okay -- Fade inactive windows
    opts = {
      tint = -18,
      saturation = 0.7
    }
  },

  { 'andrewferrier/debugprint.nvim', -- handy!
    config = true
  },
  -- 'LukasPietzschmann/telescope-tabs', -- usable
  {
    'booperlv/nvim-gomove', -- usable -- move pieces
    opts = {
      -- whether or not to map default key bindings, (true/false)
      map_defaults = true,
      -- whether or not to reindent lines moved vertically (true/false)
      reindent = true,
      -- whether or not to undojoin same direction moves (true/false)
      undojoin = true,
      -- whether to not to move past end column when moving blocks horizontally, (true/false)
      move_past_end_col = false,
    },
  },

  {
    'kwkarlwang/bufjump.nvim', -- good -- jump in history a buffer at once
    config = true,
    opts = {
      forward = "<A-i>",
      backward = "<A-o>",
      on_success = nil
    }
  },

  'sindrets/diffview.nvim', -- great -- cycle through diffs
  {
    'simrat39/symbols-outline.nvim', -- okay
    config = true
  },
  'gennaro-tedesco/nvim-peekup', -- usage:""
  -- 'trmckay/based.nvim', -- no effect
  -- { 'utilyre/barbecue.nvim', dependencies = { 'SmiteshP/nvim-navic' } }, -- maybe
  {
    'petertriho/nvim-scrollbar', -- okay
    config = true
  },

  {
    'Wansmer/treesj', -- split/join
    config = { use_default_keymaps = false, max_join_length = 440 }
  },
  -- 'bennypowers/splitjoin.nvim',
  -- { 'echasnovski/mini.splitjoin', version = '*' },
  -- 'nyngwang/murmur.lua', -- no effect
  -- {
  --   'AckslD/nvim-trevJ.lua', -- split arguments
  --   -- config = 'require("trevj").setup()'
  --   config = true
  -- },

  'tamton-aquib/zone.nvim', -- fun

  'gorbit99/codewindow.nvim', -- ... -- minimap
  'rareitems/hl_match_area.nvim',
  'Eandrju/cellular-automaton.nvim',

  'nullchilly/fsread.nvim', -- funky -- read fast
  {
    'JellyApple102/easyread.nvim',
    config = 'require("easyread").setup()',
  },
  'folke/paint.nvim',
  'folke/styler.nvim',
  -- 'LintaoAmons/scratch.nvim',
  'AbdelrahmanDwedar/awesome-nvim-colorschemes',
  'diegoulloao/nvim-file-location',
  'lewis6991/satellite.nvim',
  -- { 'j-hui/fidget.nvim', tag = 'legacy' }, -- silly warning
  'cbochs/portal.nvim', -- error
  'ziontee113/neo-minimap',
  'princejoogie/dir-telescope.nvim',
  -- 'pocco81/true-zen.nvim',

  {
    'lewis6991/gitsigns.nvim', -- cool
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup() -- take it to scrollbar
    end,
  },

  {
    'folke/flash.nvim', -- cool -- nav line
    config = 'require("flash").setup()'
  },
  'SmiteshP/nvim-navbuddy', -- look up!

  {
    'glepnir/lspsaga.nvim',
    event = "LspAttach",
    config = function() require("lspsaga").setup() end,
    dependencies = { {"kyazdani42/nvim-web-devicons"}, {"nvim-treesitter/nvim-treesitter"} }
  },

  'tzachar/local-highlight.nvim',
  'RRethy/vim-illuminate',
  {
    'dvoytik/hi-my-words.nvim',
    config = function()
      require("hi-my-words")
      vim.api.nvim_set_keymap("n", ",a", ":HiMyWordsToggle<CR>", { noremap = true })
    end,
  },

  {
  'chrisgrieser/nvim-spider', -- works -- better word margins
    config = function()
      vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },

  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function(hop)
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      -- local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, {remap=true})
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, {remap=true})
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, {remap=true})
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, {remap=true})
    end,
  },

  { 'ecthelionvi/NeoColumn.nvim', -- okay -- highlight long lines
    opts = {
      -- bg_color = "878787"
      fg_color = "",
      bg_color = "",
      NeoColumn = "100",
      custom_NeoColumn = { bash = "120"},
      excluded_ft = { "text", "markdown" },
    }
  },

  'ziontee113/syntax-tree-surfer',
  'AckslD/nvim-neoclip.lua', -- no effect
  'mizlan/iswap.nvim',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  -- 'haolian9/reveal.nvim', -- no effect
  -- 'Dax89/ide.nvim', -- maybe
  -- 'rktjmp/lush.nvim', -- for coloscheme making
  -- 'gaoDean/autolist.nvim', -- no effect
  -- 'marcuscaisey/olddirs.nvim', --promising
  -- 'freddiehaddad/feline.nvim', --on watch
  'prochri/telescope-all-recent.nvim',
  -- 'CKolkey/ts-node-action',
  'smzm/hydrovim',
  'luukvbaal/statuscol.nvim', --ambitious
  -- 'mrjones2014/legendary.nvim',
  -- 'folke/which-key.nvim',
  -- 'Wansmer/sibling-swap.nvim',
  'RaafatTurki/hex.nvim',
  'JoosepAlviste/palenightfall.nvim',
  -- 'danielfalk/smart-open.nvim', --funky telescope mode
  'tsakirist/telescope-lazy.nvim',
  -- 'altermo/ultimate-autopair.nvim',
  -- 'chrisgrieser/nvim-various-textobjs', -- many
  { 'AckslD/muren.nvim', config = true }, -- wow
  -- 'axkirillov/hbac.nvim', ]]

--------------------------------
--          Themes:           --
--------------------------{{{}}}

  'felipeagc/fleet-theme-nvim',
  'uloco/bluloco.nvim', -- have transprent
  '2nthony/vitesse.nvim',
  'gbprod/nord.nvim',
  'Yazeed1s/oh-lucy.nvim',
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

{ root = vim.env.PLUGD, }
)

