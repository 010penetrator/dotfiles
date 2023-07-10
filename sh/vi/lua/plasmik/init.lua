-- vim: ts=2 sw=2
-- FYI: Use checkhealth to troubleshoot Neovim

-- print('hello from plasmik')
-- vim.opt.more = false
-- vim.api.nvim_command('echom 88')
-- require("plasmik.remm")

require("plasmik.set")

package.loaded['plasmik.helpy'] = nil
H = require("plasmik.helpy")

require("plasmik.bootstrap")
vim.api.nvim_command('set runtimepath+=$vi') -- Repair rtp after plugging

require("plasmik.lsp")
require("plasmik.cmp")

H.reload("plasmik.mappings")


--------------------------------
--      Configure Plugs       --
--------------------------{{{}}}

local is_available = H.is_available
-- if is_available "mason.nvim" then
  -- do stuff
-- end

if is_available "nvim-gomove" then
    require("gomove").setup = {
      map_defaults = true,
      reindent = true,
      undojoin = true,
      move_past_end_col = false,
    }
end

if is_available "syntax-tree-surfer" then
  -- Syntax Tree Surfer
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

require("telescope").setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = {
        ["<c-a>"] = function() print("tryitout") end,
      }
    }
  },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

require("telescope").load_extension('fzf')
-- local theme = require("telescope.themes").get_ivy()
-- theme['layout_config']['height'] = vim.opt.lines:get() - 8
-- theme['sort_mru'] = true
-- require("telescope.builtin").buffers(theme)
-- require("telescope.builtin").buffers(Tele_drop)

require("nvim-treesitter.configs").setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'vim', 'bash' },
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

-- vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

require("marks").setup {
  -- default_mappings = true,
  -- which builtin marks to show. default {}
  -- builtin_marks = { ".", "<", ">", "^" },
  builtin_marks = { ".", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=12, upper=18, builtin=8, bookmark=25 },
  -- disables mark tracking for specific filetypes. default {}
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

-- require("neoscroll").setup {
--   easing_function = "circular",
--   mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'}
-- }
-- local t = {}
-- t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '400', [['cubic']]}}
-- t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '400', [['cubic']]}}
-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '600', [['circular']]}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '600', [['circular']]}}
-- -- t['<C-y>'] = {'scroll', { -4, 'false', '250', "quadratic"}}
-- -- t['<C-e>'] = {'scroll', {  4, 'false', '250', "quadratic"}}
-- t['zt']    = {'zt', {'100'}}
-- t['zz']    = {'zz', {'100'}}
-- t['zb']    = {'zb', {'100'}}
-- require("neoscroll.config").set_mappings(t)

