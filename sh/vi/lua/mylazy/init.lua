return {

  ---- VIM BASIC -------------------------------------------
  -- 'justinmk/vim-sneak', -- good!
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }, -- fantastic
  -- 'tpope/vim-sensible', -- basic
  -- 'tpope/vim-commentary',
  -- 'tpope/vim-surround', -- good
  -- 'tpope/vim-endwise', -- okay
  'tpope/vim-repeat', -- handy
  'tpope/vim-eunuch', -- handy
  'tpope/vim-fugitive', -- handy
  'mhinz/vim-startify', --great
  'jlanzarotta/bufexplorer', -- basic
  -- 'michaeljsmith/vim-indent-object', -- cool
  -- 'godlygeek/tabular', -- okay
  'junegunn/vim-easy-align',
  'jamessan/vim-gnupg', -- good
  -- 'chrisbra/Colorizer', -- good
  'MattesGroeger/vim-bookmarks', -- great
  'haya14busa/vim-edgemotion', -- great -- Use with <C-j>
  'will133/vim-dirdiff',
  -- 'tpope/vim-sleuth',
  -- 'ZeroKnight/vim-signjump', -- buggy
  -- 'vim-scripts/QuickBuf',
  -- 'liuchengxu/vista.vim',
  -- 'derekwyatt/vim-fswitch',
  -- 'tpope/vim-unimpaired',
  'dkarter/bullets.vim',

  ---- NEOVIM ONLY -----{{{}}}------------------------------

  -- require'plugins.better-escape',
  -- require'plugins_lazy.themes',
  -- require'plugins_lazy',
  -- { import = "plugins_lazy" },

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
    dependencies = {
      'SmiteshP/nvim-navbuddy',
      'glepnir/lspsaga.nvim',
    },
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
    config = true,
  },

  'folke/paint.nvim',
  'folke/styler.nvim', --   colo per filetype
  -- 'LintaoAmons/scratch.nvim',
  'AbdelrahmanDwedar/awesome-nvim-colorschemes',
  -- 'lewis6991/satellite.nvim', --   add scrollbar

  --[[ {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = true,
  }, ]]

  -- 'cbochs/portal.nvim', -- error
  'ziontee113/neo-minimap', -- cant configure -- cool tags map
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

  --[[ {
    'glepnir/lspsaga.nvim',
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true
  }, ]]

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
      themes = { "C64", "NeoSolarized", "OceanicNext", "OceanicNextLight", "Tomorrow" }
    }
  },

}
