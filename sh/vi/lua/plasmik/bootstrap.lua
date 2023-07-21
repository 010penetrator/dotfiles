-- vim: ts=2 sw=2
-- Install plugins manager and install plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Install lazy.nvim
-- local lazypath = vim.env.PLUGDIR .. "/lazy/lazy.nvim"
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
  'mhinz/vim-startify', --great
  -- 'sheerun/vim-polyglot', -- okay HUGE
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


  --[[ {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = function()
      local dashboard = require('alpha.themes.dashboard')
      require('alpha.term')
      dashboard.section.terminal.command = "bash $vi/nvim-logo -o"
      dashboard.section.terminal.width = 70
      dashboard.section.terminal.height = 10
      dashboard.section.terminal.opts.redraw = true
      dashboard.section.terminal.opts.window_config.zindex = 1
      dashboard.opts.layout = {
        dashboard.section.terminal,
        { type = "padding", val = 4 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }
      return dashboard
    end,
    -- config = function() require'alpha'.setup(require'alpha.themes.startify'.config) end,
    config = function(_, dashboard)
      require('alpha').setup(dashboard.opts)
    end,
  }, ]]

  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'nvim-lua/plenary.nvim',
  'powerman/vim-plugin-ruscmd', -- works
  'williamboman/mason.nvim', -- base -- load TS servers
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-lint',
  'jay-babu/mason-nvim-dap.nvim',
  'rcarriga/nvim-dap-ui',
  'niuiic/dap-utils.nvim',

  'nvim-telescope/telescope-dap.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd("silent TSUpdate")
    end,
  },

  {
    'utilyre/barbecue.nvim', -- maybe
    dependencies = { 'SmiteshP/nvim-navic' },
    name = "barbecue",
    version = "*",
    config = true
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { {
      'SmiteshP/nvim-navbuddy',
      'glepnir/lspsaga.nvim',
    } },
  },

  {
    'SmiteshP/nvim-navbuddy', -- cool -- code map (call :Navbuddy)
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
    },
    opts = { lsp = { auto_attach = true } }
  },
  {
    'SmiteshP/nvim-navic', -- good -- nav string
    opts = { lsp = { auto_attach = true } }
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
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    -- config = function()
    --   require("your.null-ls.config") -- require your null-ls config here (example below)
    -- end,
  },

  'kevinhwang91/rnvimr', -- include ranger
  -- 'mrjones2014/nvim-ts-rainbow', -- buggy
  'https://gitlab.com/HiPhish/nvim-ts-rainbow2',
  'chentoast/marks.nvim', -- good -- better marks
  'lambdalisue/suda.vim', -- perfect -- Sudo file operations

  {
    'declancm/cinnamon.nvim', -- works -- Hacky Smooth scroll
    opts = {
      default_keymaps = false,  -- Create default keymaps.
      extra_keymaps = false,    -- Create extra keymaps.
      extended_keymaps = false, -- Create extended keymaps.
      override_keymaps = false, -- The plugin keymaps will override any existing keymaps.
      always_scroll = true,     -- Scroll the cursor even when the window hasn't scrolled.
      centered = true,          -- Keep cursor centered in window when using window scrolling.
      disabled = false,         -- Disables the plugin.
      default_delay = 5,        -- The default delay (in ms) between each line when scrolling.
      hide_cursor = false,      -- Hide the cursor while scrolling. Requires enabling termguicolors!
      horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
      max_length = 70,          -- Maximum length (in ms) of a command. The line delay will be re-calculated. Setting to -1 will disable this option.
      scroll_limit = 150,       -- Max number of lines moved before scrolling is skipped. Setting to -1 will disable this option.
    }
  },
  -- 'karb94/neoscroll.nvim', -- maybe

  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = {
      sections = {
        lualine_c = {
          {
            'filename',
            -- color_correction = 'dynamic',
            -- "navic",
            -- color_correction = 'dynamic',
            -- navic_opts = nil
          }
        }
      },
      options = {
        -- section_separators = '',
        component_separators = '',
        theme = 'nord',
        -- theme = 'nordic',
      },
    },
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

  --[[ {
    'windwp/nvim-autopairs',
    config = function()
      local pl = require('nvim-autopairs')
      pl.setup()
      pl.remove_rule("'")
      pl.remove_rule('"')
    end,
  }, ]]

  --[[ {
    'm4xshen/autoclose.nvim', -- problem
    config = true
  }, ]]

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

  {
    'lukas-reineke/indent-blankline.nvim', -- usable
    opts = {
      filetype_exclude = {'lspinfo', 'checkhealth', 'help', 'man', '', 'startify'},
      enabled = false,
      show_end_of_line = false,
      show_current_context = true,
      -- show_current_context_start = true,
      show_trailing_blankline_indent = false,
      char = '░',
      char_blankline = "",
      context_char_blankline = "⋅",
      space_char_blankline = ' ',
      context_char = '│',
      -- ⋮ ⋅ ░ ∷
      -- ┊
    }
    -- let g:indent_blankline_buftype_exclude = ['terminal', 'nofile', 'quickfix', 'prompt', 'startify']
    -- let g:indent_blankline_filetype_exclude = {'terminal', 'nofile', 'quickfix', 'prompt', 'help', 'startify'}
  },

  'norcalli/nvim-colorizer.lua',
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim', -- cool -- multiline lsp hints

  {
    'folke/trouble.nvim',
    config = true
  },

  --[[ {
    'levouh/tint.nvim', -- okay -- Fade inactive windows
    opts = {
      tint = -18,
      saturation = 0.7
    }
  }, ]]

  { 'andrewferrier/debugprint.nvim', -- handy!
    config = true
  },
  -- 'LukasPietzschmann/telescope-tabs', -- usable

  -- 'booperlv/nvim-gomove', -- usable -- move text pieces
  -- 'ziontee113/syntax-tree-surfer', --   move with TS
  'fedepujol/move.nvim',

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
    'simrat39/symbols-outline.nvim', -- okay -- symbol tree
    config = true
  },
  'gennaro-tedesco/nvim-peekup', -- usage:""
  -- 'trmckay/based.nvim', -- no effect
  {
    'petertriho/nvim-scrollbar', -- okay
    config = true
  },

  {
    'Wansmer/treesj', -- great -- split/join
    opts = {
      use_default_keymaps = false,
      max_join_length = 440,
    }
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

  {
    'gorbit99/codewindow.nvim', -- ... -- minimap
    config = true
  },

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
  -- 'lewis6991/satellite.nvim', --   add scrollbar

  --[[ {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = true,
  }, ]]

  -- 'cbochs/portal.nvim', -- error
  'ziontee113/neo-minimap',
  'princejoogie/dir-telescope.nvim',
  -- 'pocco81/true-zen.nvim',

  {
    'rbong/vim-flog', -- provides git graph
    dependencies = 'tpope/vim-fugitive',
  },

  -- {
  --   'NeogitOrg/neogit', -- fail
  --   dependencies = 'nvim-lua/plenary.nvim',
  --   config = true,
  -- },

  -- 'airblade/vim-gitgutter',
  {
    'lewis6991/gitsigns.nvim', -- cool
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup() -- take it to scrollbar
    end,
  },

  --[[ {
    'folke/flash.nvim', -- ...
    config = 'require("flash").setup()'
  }, ]]

  {
    'glepnir/lspsaga.nvim',
    dependencies = { "kyazdani42/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    config = true
  },

  -- {
  --   'tzachar/local-highlight.nvim',
  --   opts = {
  --     -- file_types = {'python', 'cpp'}, -- If this is given only attach to this
  --     -- OR attach to every filetype except:
  --     -- disable_file_types = {'tex'},
  --     hlgroup = 'Search',
  --     cw_hlgroup = nil,
  --   },
  -- },

  'RRethy/vim-illuminate', --   highlight current word

  {
    'dvoytik/hi-my-words.nvim', -- highlight words you wish
    config = true
  },

  --[[ {
  'chrisgrieser/nvim-spider', -- works -- better word margins
    config = function()
      vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  }, ]]

  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      local hop = require('hop')
      hop.setup { keys = 'etovxqpdygfblzhckisuran' }
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('n', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
      vim.keymap.set('n', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
      vim.keymap.set('n', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
      vim.keymap.set('n', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, {remap=true})
    end,
  },

  {
    'ecthelionvi/NeoColumn.nvim', -- okay -- highlight long lines
    opts = {
      -- bg_color = "878787"
      fg_color = "",
      bg_color = "",
      NeoColumn = "100",
      custom_NeoColumn = { bash = "120"},
      excluded_ft = { "text", "markdown" },
    }
  },

  {
    'norlock/nvim-traveller',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    opts = {
      -- replace_netrw = true,
      sync_cwd = true,
    },
    config = function(_, opts)
      local traveller = require("nvim-traveller")
      traveller.setup(opts)
      vim.keymap.set('n', '_', traveller.open_navigation, {})
      -- Really fast navigation through directories with traveller compatibility
      vim.keymap.set('n', '<leader>d', traveller.open_telescope_search, silent_options)
    end
  },

  {
    'tzachar/highlight-undo.nvim',
      config = function()
        require('highlight-undo').setup {
            duration = 1400,
          }
      end
  },

  { 'prochri/telescope-all-recent.nvim', dependencies = {'kkharji/sqlite.lua'} },

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
  -- 'CKolkey/ts-node-action',
  'smzm/hydrovim', --    eval python
  'luukvbaal/statuscol.nvim', --ambitious
  -- 'mrjones2014/legendary.nvim',
  -- 'folke/which-key.nvim',
  -- 'Wansmer/sibling-swap.nvim',
  'RaafatTurki/hex.nvim',
  -- 'danielfalk/smart-open.nvim', --funky telescope mode
  'tsakirist/telescope-lazy.nvim',
  -- 'altermo/ultimate-autopair.nvim',
  -- 'chrisgrieser/nvim-various-textobjs', -- many
  -- { 'AckslD/muren.nvim', config = true }, -- wow
  -- 'axkirillov/hbac.nvim', ]]
  -- 'rareitems/hl_match_area.nvim',
  -- 'Eandrju/cellular-automaton.nvim',

  {
    'zaldih/themery.nvim',
    opts = {
      themes = { "C64", "NeoSolarized", "OceanicNext", "OceanicNextLight", "Tomorrow", "Tomorrow-Night", "Tomorrow-Night-Blue", "Tomorrow-Night-Bright", "Tomorrow-Night-Eighties", "alduin", "apprentice", "artesanal", "atlantis", "ayu", "ayu-dark", "ayu-light", "ayu-mirage", "blue", "bluewery", "bluewery-light", "bluewery-text-writing", "bluloco", "bluloco-dark", "bluloco-light", "carbonfox", "catppuccin", "catppuccin-frappe", "catppuccin-latte", "catppuccin-macchiato", "catppuccin-mocha", "cryslominsa", "dark_eyes", "darkblue", "darkplus", "dawnfox", "dayfox", "default", "delek", "desert", "desert-night", "dracula", "duskfox", "edge", "eighties", "elflord", "evening", "everforest", "fairy-garden", "fantasy", "fight-in-the-shade", "fleet", "fluoromachine", "frign", "garden", "github_dark", "github_dark_colorblind", "github_dark_default", "github_dark_dimmed", "github_dark_high_contrast", "github_dark_tritanopia", "github_dimmed", "github_light", "github_light_colorblind", "github_light_default", "github_light_high_contrast", "github_light_tritanopia", "grimoire", "gruvbox", "gruvbox-material", "habamax", "hybrid", "hybrid_material", "hybrid_reverse", "ice-age", "iceberg", "immortals", "industry", "kanagawa", "kanagawa-dragon", "kanagawa-lotus", "kanagawa-wave", "kat.nvim", "kat.nwim", "knicks-away", "koehler", "lost-shrine", "lucius", "lunaperche", "melange", "mellow", "messy", "minimal", "minimal-base16", "miramare", "moody", "morning", "murphy", "nebula", "nightfox", "nord", "nordfox", "nordic", "off", "oh-lucy", "oh-lucy-evening", "onedark", "onehalfdark", "onehalflight", "onenord", "pablo", "palenightfall", "paper", "peachpuff", "perun", "plastic", "quiet", "ron", "rose-pine", "rose-pine-dawn", "rose-pine-main", "rose-pine-moon", "rusticated", "sacredforest", "shine", "slate", "snow", "solarized", "solarized-flat", "solarized-high", "solarized-low", "spacemacs-theme", "spartan", "stellarized", "substrata", "subtle_dark", "subtle_light", "tayra", "tempus_autumn", "tempus_classic", "tempus_dawn", "tempus_day", "tempus_dusk", "tempus_fugit", "tempus_future", "tempus_night", "tempus_past", "tempus_rift", "tempus_spring", "tempus_summer", "tempus_tempest", "tempus_totus", "tempus_warp", "tempus_winter", "terafox", "thermopylae", "tokyonight", "tokyonight-day", "tokyonight-moon", "tokyonight-night", "tokyonight-storm", "torte", "tundra", "turtles", "typewriter", "typewriter-night", "vadelma", "vanilla-cake", "vitesse", "zellner" }
    }
  },


--------------------------------
--          Themes:           --
--------------------------{{{}}}

  'antonk52/lake.nvim',
  'xero/miasma.nvim',
  'nvimdev/oceanic-material',
  'maxmx03/FluoroMachine.nvim', -- neeooooon
  { "2nthony/vitesse.nvim", dependencies = { "tjdevries/colorbuddy.nvim" }, }, -- foresty
  'felipeagc/fleet-theme-nvim',
  'uloco/bluloco.nvim', -- have transprent
  '2nthony/vitesse.nvim',
  'JoosepAlviste/palenightfall.nvim',
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

{ root = vim.env.PLUGDIR, }
)

