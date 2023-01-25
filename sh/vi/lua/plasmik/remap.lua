
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

-- H.nmap(',gp', vim.api.nvim_command('colo'))
H.nmap(',gp', ":call FocusBufOrDo('bootstrap.lua','e $mylua/bootstrap.lua')<CR>")

H.bram_nmap('<C-PageUp>',   ":BufferLineCyclePrev<CR>", { silent = true })
H.bram_nmap('<C-PageDown>', ":BufferLineCycleNext<CR>", { silent = true })

H.nmap('c<BS>', ":call ReloadStyle()<CR>")

H.nmap(',vp', function() vim.api.nvim_exec([[:put +| normal dfmxI'A',==]], false) end)


