-- vim: ts=2 sw=2
-- FYI: Use checkhealth to troubleshoot Neovim

-- print('hello from init.lua')
-- vim.opt.more = false
-- vim.api.nvim_command('echom 88')

require("set")

package.loaded['helpy'] = nil
H = require("helpy")
local is_available = H.is_available

-- H.tprint(vim.opt.rtp)

require("init_lazy")
vim.api.nvim_command('set runtimepath+=$vi') -- Repair rtp after plugging

H.reload("lsp")

H.reload("mappings")

-- require("scratchpad")

--------------------------------
--      Configure Plugs       --
--------------------------{{{}}}

--[[ if is_available "mason.nvim" then
  vim.g.startify_custom_header = 'startify#pad(split(system("bash $vi/nvim-logo -b"),"\n"))'
end ]]

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

-- vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

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

