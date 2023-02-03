-- vim: ts=2 sw=2

------------------------
--      Keymaps:      --
------------------{{{}}}

vim.api.nvim_command('\
nnoremap <silent> gh <cmd>ClangdSwitchSourceHeader<CR>|\
nnoremap <silent> z<Down> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>|\
nnoremap <silent> z<Up> k<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>|\
nnoremap <silent> ,S <cmd>lua vim.lsp.buf.signature_help()<CR>|\
')

vim.keymap.set('n','K', vim.lsp.buf.hover, {buffer=0})
H.nmap('gv', function() vim.cmd('vsplit') vim.lsp.buf.definition() end)
-- H.nmap('gv', function() vim.api.nvim_open_win(true,true,{}) vim.lsp.buf.definition() end)
-- vim.keymap.set('n', "gl", "<cmd>let bn=bufnr('%') <bar> let pos=getpos('.') <bar> wincmd p <bar> exec 'b' . bn <bar> call setpos('.',pos) <bar> lua vim.lsp.buf.definition()<CR>" )
H.nmap('gl', function() H.mirror_buf_to_prev_window() vim.lsp.buf.definition() end)
-- H.nmap('gd', vim.lsp.buf.definition)
-- H.nmap('gD', vim.lsp.buf.declaration)
H.nmap('gs', vim.lsp.buf.document_symbol)
H.nmap('gr', vim.lsp.buf.references)
H.nmap('gw', vim.lsp.buf.workspace_symbol)
H.nmap('gy', vim.lsp.buf.type_definition)
H.nmap('gi', vim.lsp.buf.implementation)
H.nmap('z<down>', vim.diagnostic.goto_next)
H.nmap('z<up>', vim.diagnostic.goto_prev)
H.nmap(',r', vim.lsp.buf.rename)
H.nmap('qa', vim.lsp.buf.code_action)

H.nmap('qt', vim.diagnostic.open_float)
H.nmap('qb', vim.diagnostic.setloclist)

-- Yank and put incremental
vim.keymap.set('n', ',y', "\"Yy")
vim.keymap.set('v', ',y', "\"Yy")
vim.keymap.set('n', ',p', "\"yp")
vim.keymap.set('x', ',p', "\"_dP")

-- Move selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

H.bram_nmap('<C-PageUp>',   ":BufferLineCyclePrev<CR>", { silent = true })
H.bram_nmap('<C-PageDown>', ":BufferLineCycleNext<CR>", { silent = true })

H.nmap('c<BS>', ":call ReloadStyle()<CR>")
H.nmap(',gp', ":call FocusBufOrDo('bootstrap.lua','e $mylua/bootstrap.lua')<CR>")
H.nmap(',vp', function() vim.api.nvim_exec([[:put +| normal dfmxI'A',==]], false) end)

