-- vim: ts=2 sw=2
-- FYI: Use checkhealth to troubleshoot Neovim

-- print('hello from init.lua')
-- vim.opt.more = false
-- vim.api.nvim_command('echom 88')
-- vim.cmd('echo 42' .. ' 101')

require("set")

package.loaded['helpy'] = nil
H = require("helpy")
local is_available = H.is_available

-- H.tprint(vim.opt.rtp)

require("init_lazy")
vim.api.nvim_command('set runtimepath+=$vi') -- Repair rtp after plugging

H.reload("lsp")

H.reload("mappings")

local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
PL = lazy_config.plugins

-- vim.cmd([[
--   vimscript here
-- ]])

--------------------------------
--      Configure Plugs       --
--------------------------{{{}}}

--[[ if H.is_available "themery" then
  Themes = vim.api.nvim_eval("getcompletion('','color')")
  H.tprint(Themes)
  require("themery").setup({ themes =  Themes  })
end ]]

-- vim.g.startify_custom_header = 'startify#pad(split(system("bash $vi/nvim-logo -b"),"\n"))'

if is_available "nvim-gomove" then
  require("gomove").setup = {
    map_defaults = true,
    reindent = true,
    undojoin = true,
    move_past_end_col = false,
  }
end

require("nvim-treesitter.configs").setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'vim', 'bash', 'markdown' },
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[o'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [',al'] = '@parameter.inner',
      },
      swap_previous = {
        [',ah'] = '@parameter.inner',
      },
    },
  },
}

require("marks").setup {
  default_mappings = false,
  builtin_marks = { "^" }, -- which builtin marks to show
  cyclic = true,
  force_write_shada = true, -- whether the shada file is updated after modifying uppercase marks
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=12, upper=18, builtin=8, bookmark=25 },
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = ""
  },
  mappings = {
    toggle = "m.",
    delete_line = "m-",
    delete_bookmark = "m=",
    next = "t<Down>",
    prev = "t<Up>",
    next_bookmark = ",<Down>",
    prev_bookmark = ",<Up>",
    next_bookmark1 = "1<Down>",
    prev_bookmark1 = "1<Up>",
    next_bookmark2 = "2<Down>",
    prev_bookmark2 = "2<Up>",
    next_bookmark3 = "3<Down>",
    prev_bookmark3 = "3<Up>",
    next_bookmark4 = "4<Down>",
    prev_bookmark4 = "4<Up>",
  }
}

-- vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

