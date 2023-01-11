
vim.keymap.set('n', ',bf', vim.diagnostic.open_float)
-- vim.keymap.set('n', ',bl', vim.diagnostic.setloclist)

vim.keymap.set("x", ",p", "\"_dP")

-- Yank and put incremental
vim.keymap.set("n", ",y", "\"Yy")
vim.keymap.set("v", ",y", "\"Yy")
vim.keymap.set("n", ",p", "\"yp")

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
