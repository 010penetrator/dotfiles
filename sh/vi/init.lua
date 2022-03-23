-- require('keybindings')
-- require('packages')
-- require('config')

-- local configs = require'nvim-treesitter.configs'
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "mantained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

-- vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"



require('yode-nvim').setup({})

local opts = { silent=true, noremap=false }
vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('bufjump').backward()<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-n>", ":lua require('bufjump').forward()<cr>", opts)

-- vim.api.nvim_command('new')
-- vim.api.nvim_command('\
-- set scrolloff=3 |\
-- set scrolloff=2 |\
-- ')

