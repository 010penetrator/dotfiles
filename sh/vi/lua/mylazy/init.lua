-- vim: ts=2 sw=2

return {

  -- require'mylazy.better-escape',
  -- require'mylazy',
  -- { import = "mylazy" },

  ---- VIM BASIC -------------------------------------------
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }, -- fantastic
  'mhinz/vim-startify', -- great
  -- 'justinmk/vim-sneak', -- good!
  -- 'tpope/vim-sensible', -- basic
  -- 'tpope/vim-endwise', -- okay
  -- 'tpope/vim-sleuth',
  'tpope/vim-repeat', -- handy
  'tpope/vim-eunuch', -- handy
  'tpope/vim-fugitive', -- handy
  'jlanzarotta/bufexplorer', -- based
  'MattesGroeger/vim-bookmarks', -- great
  'haya14busa/vim-edgemotion', -- great --- Use with <C-j>
  'will133/vim-dirdiff', -- handy
  -- 'jamessan/vim-gnupg', -- good --- vim-only
  -- 'chrisbra/Colorizer', -- good
  -- 'michaeljsmith/vim-indent-object', -- cool
  -- 'godlygeek/tabular', -- okay
  -- 'junegunn/vim-easy-align', -- usable
  -- 'vim-scripts/QuickBuf',
  -- 'derekwyatt/vim-fswitch',

  ---- NEOVIM ONLY -----{{{}}}------------------------------

  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'nvim-lua/plenary.nvim', --- library
  'powerman/vim-plugin-ruscmd', -- works
  'williamboman/mason.nvim', -- base --- load TS servers
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
      'nvimdev/lspsaga.nvim',
    },
  },

  {
    'SmiteshP/nvim-navbuddy', -- cool --- code map (call :Navbuddy)
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
    },
    opts = { lsp = { auto_attach = true } }
  },
  {
    'SmiteshP/nvim-navic', -- good --- Nav string
    opts = { lsp = { auto_attach = true } }
  },

  'williamboman/mason-lspconfig.nvim',
  'VonHeikemen/lsp-zero.nvim', -- dive
  'amarakon/nvim-cmp-buffer-lines', -- dive
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
  },

  'kevinhwang91/rnvimr', --- include ranger
  'chentoast/marks.nvim', -- good --- better marks
  'lambdalisue/suda.vim', -- perfect --- Sudo file operations

  {
    'declancm/cinnamon.nvim', -- works --- Hacky Smooth scroll
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

  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    priority = 40,
    opts = {
      sections = {
        lualine_c = {
          {
            'filename',
            color_correction = 'dynamic',
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

  {
    'windwp/nvim-autopairs',
    enabled = false,
    config = function()
      local pl = require('nvim-autopairs')
      pl.setup()
      pl.remove_rule("'")
      pl.remove_rule('"')
    end,
  },

  --[[ {
    'm4xshen/autoclose.nvim', -- problem
    config = true
  }, ]]

  {
    'kylechui/nvim-surround', -- okay --- classics remake
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
    'numToStr/Comment.nvim', -- good --- hit 'gcc' to comment
    config = true
  },

  {
    'akinsho/toggleterm.nvim', -- great --- fast terminal
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

  'folke/which-key.nvim',

  'norcalli/nvim-colorizer.lua',

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim', -- cool --- multiline lsp hints
    config = function()
      -- turn it off on start
      require'lsp_lines'.toggle()
      require'lsp_lines'.toggle()
    end,
    -- keys = ",l",
  },

  {
    'folke/trouble.nvim',
    config = true
  },

  {
    'andrewferrier/debugprint.nvim', -- handy! --- auto insert logging lines
    config = true
  },

  'LukasPietzschmann/telescope-tabs', -- usable

  {
    'ziontee113/syntax-tree-surfer', --- move with TS
    config = function()
      require("syntax-tree-surfer").setup()
      local noresil = { noremap = true, silent = false }
      -- Normal Mode Swapping:
      -- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
      vim.keymap.set("n", "vU", function()
        vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      vim.keymap.set("n", "vD", function()
        vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      -- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
      vim.keymap.set("n", "vd", function()
        vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      vim.keymap.set("n", "vu", function()
        vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      -- Visual Selection from Normal Mode
      vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', noresil)
      vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', noresil)
      -- Select Nodes in Visual Mode
      vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', noresil)
      vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', noresil)
      vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', noresil)
      vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', noresil)
      -- Swapping Nodes in Visual Mode
      vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', noresil)
      vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', noresil)
    end
  },

  {
    'booperlv/nvim-gomove', --- move keep indent
    opts = {
      map_defaults = true,
      reindent = true,
    }
  },

  {
    'kwkarlwang/bufjump.nvim', -- good --- jump in history a buffer at once
    config = true,
    opts = {
      forward = "<A-i>",
      backward = "<A-o>",
      on_success = nil
    }
  },

  'sindrets/diffview.nvim', -- great --- cycle through diffs

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
    'simrat39/symbols-outline.nvim', -- okay --- symbols tree based on lsp 
    config = true
  },

  'gennaro-tedesco/nvim-peekup', -- so-so --- clipboard history,  usage:""

  {
    'trmckay/based.nvim', --- decode hex and octal to decimal
    config = function()
      H.nmap(",cb", require'based'.convert)
    end
  },

  {
    'petertriho/nvim-scrollbar', -- okay
    config = function()
      require("scrollbar").setup()
      H.nmap(',vs', ":ScrollbarToggle<CR>")
    end
  },

  {
    'Wansmer/treesj', -- great --- split/join
    opts = {
      use_default_keymaps = false,
      max_join_length = 440,
    }
  },

  {
    'levouh/tint.nvim', -- okay --- fade inactive windows
    opts = {
      tint = -18,
      saturation = 0.7
    },
    config = function(_, opts)
      local tint = require("tint")
      tint.setup(opts)
      tint.disable()
    end
  },

  -- { 'echasnovski/mini.splitjoin', version = '*' },

  {
    'echasnovski/mini.files',
    version = false,
    -- config = true,
    config = function()
      require("mini.files").setup()
      H.nmap(",h", MiniFiles.open)
    end
  },

  'tamton-aquib/zone.nvim', -- fun --- joke screensaver

  {
    'https://gitlab.com/HiPhish/nvim-ts-rainbow2', -- okay
    config = function()
      H.nmap(',vr', ":TSToggle rainbow<CR>")
    end
  },
  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', -- problem
    enabled = false,
    config = function()
      require 'rainbow-delimiters.setup'
    end
  },

  {
    'gaoDean/autolist.nvim', --- Bullets
    ft = { "markdown", "text", "" },
    config = true,
  },

  {
    'zaldih/themery.nvim',
    priority = 90,
    config = function()
      function ThemeryWrapper()
        if H.is_available "themery.nvim" then
          if not H.Themes then
            H.Themes = vim.api.nvim_eval("getcompletion('','color')")
            print("Themes list updated")
            require("themery").setup({ themes =  H.Themes  })
          else
            print("Themes is")
          end
          -- H.tprint(H.Themes)
          vim.cmd("Themery")
        else
          print'no avail'
        end
      end
      H.nmap(',,t', ThemeryWrapper)
    end
  },


  ---------------------------------------------{{{}}}-------

  {
    'gorbit99/codewindow.nvim', -- dive --- minimap
    config = true
  },

  'nullchilly/fsread.nvim', -- funky --- read fast
  {
    'JellyApple102/easyread.nvim',
    config = true,
  },

  'folke/paint.nvim',
  'folke/styler.nvim', --- colo per filetype
  'LintaoAmons/scratch.nvim',
  'AbdelrahmanDwedar/awesome-nvim-colorschemes',

  {
    'j-hui/fidget.nvim',
    enabled = false,
    tag = 'legacy',
    config = true,
  },

  'cbochs/portal.nvim', -- problem
  'ziontee113/neo-minimap', -- nice --- cool tags map
  'princejoogie/dir-telescope.nvim',
  'pocco81/true-zen.nvim',

  {
    'rbong/vim-flog', --- provides git graph
    dependencies = 'tpope/vim-fugitive',
  },

  {
    'NeogitOrg/neogit', -- problem
    enabled = false,
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },

  {
    'lewis6991/gitsigns.nvim', -- cool
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup() -- take it to scrollbar
    end,
  },

  {
    'folke/flash.nvim', -- problem
    enabled = false,
    config = 'require("flash").setup()'
  },

  {
    'nvimdev/lspsaga.nvim', -- good
    enabled = false,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true
  },

  {
    'tzachar/local-highlight.nvim',
    enabled = false,
    opts = {
      -- file_types = {'python', 'cpp'}, -- If this is given only attach to this
      -- OR attach to every filetype except:
      -- disable_file_types = {'tex'},
      hlgroup = 'Search',
      cw_hlgroup = nil,
    },
  },

  'RRethy/vim-illuminate', --- highlight current word
  {
    'dvoytik/hi-my-words.nvim', --- highlight words you wish
    config = true
  },

  {
  'chrisgrieser/nvim-spider', -- works --- better word margins
    enabled = false,
    config = function()
      vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },

  {
    'ecthelionvi/NeoColumn.nvim', -- okay --- highlight long lines
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

  {
    'AckslD/nvim-neoclip.lua', -- problem
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = true,
  },

  {
    'goolord/alpha-nvim',
    enabled = false,
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
  },

  'mizlan/iswap.nvim',
  -- 'lewis6991/satellite.nvim', --- add scrollbar
  -- 'Dax89/ide.nvim', -- maybe
  -- 'rktjmp/lush.nvim', --- for coloscheme making
  'marcuscaisey/olddirs.nvim', -- promising
  -- 'freddiehaddad/feline.nvim', -- on watch
  'CKolkey/ts-node-action',
  'Wansmer/sibling-swap.nvim',
  'smzm/hydrovim', --- eval python
  'luukvbaal/statuscol.nvim', -- ambitious
  'mrjones2014/legendary.nvim',
  'RaafatTurki/hex.nvim',
  'danielfalk/smart-open.nvim', --- funky telescope mode
  'tsakirist/telescope-lazy.nvim',
  -- 'chrisgrieser/nvim-various-textobjs',
  -- { 'AckslD/muren.nvim', config = true }, -- wow
  -- 'axkirillov/hbac.nvim', ]]
  -- 'rareitems/hl_match_area.nvim',
  'Eandrju/cellular-automaton.nvim',
  -- 'altermo/ultimate-autopair.nvim',
  -- 'nyngwang/murmur.lua', -- problem
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',



}
