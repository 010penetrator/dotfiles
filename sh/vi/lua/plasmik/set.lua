-- vim: ts=2 sw=2

vim.opt.guicursor = ""

-- Highlight on yank -- see `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- disable netrw early in user/init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

