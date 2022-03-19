-- require('keybindings')
-- require('packages')
-- require('config')

-- local configs = require'nvim-treesitter.configs'
-- configs.setup {
--   ensure_installed = "mantained",
--   highlight = {
--     enable = true,
--   },
--   indent = {
--     enable = true,
--   }
-- }

require('yode-nvim').setup({})

local opts = { silent=true, noremap=false }
vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('bufjump').backward()<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-n>", ":lua require('bufjump').forward()<cr>", opts)

