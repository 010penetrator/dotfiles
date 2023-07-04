-- vim: ts=2 sw=2

--------------------------------
--      Update Keymaps        --
--------------------------{{{}}}

vim.api.nvim_command('\
  nnoremap <silent> gh <cmd>ClangdSwitchSourceHeader<CR>|\
')

H.nmap('z<Down>', function() vim.lsp.diagnostic.goto_next() end)
H.bram_nmap('z<Up>', "k<cmd>vim.lsp.diagnostic.goto_prev")
H.nmap(',S', vim.lsp.buf.signature_help)

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
H.nmap(',R', vim.lsp.buf.rename)
H.nmap('qa', vim.lsp.buf.code_action)

H.nmap('qt', vim.diagnostic.open_float)
H.nmap('qb', vim.diagnostic.setloclist)

H.nmap(',"', function() require'nvim-peekup'.peekup_open('p') end )

-- Yank and put incremental
-- vim.keymap.set('n', ',y', "\"Yy")
-- vim.keymap.set('v', ',y', "\"Yy")
-- vim.keymap.set('n', ',p', "\"yp")
-- vim.keymap.set('x', ',p', "\"_dP")

-- Move selection
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

H.bram_nmap('<C-PageUp>',   ":BufferLineCyclePrev<CR>", { silent = true })
H.bram_nmap('<C-PageDown>', ":BufferLineCycleNext<CR>", { silent = true })

H.nmap(',n', ":NeoTreeRevealToggle<CR>")
-- H.nmap(',N', ":NeoTreeClose<CR>")
H.nmap(',<BS>', ":Neotree reveal_force_cwd<CR>")
H.nmap('-', ":Neotree reveal_force_cwd current<CR>")
H.nmap(',,b', ":IndentBlanklineToggle<CR>")
H.nmap('c<BS>', ":call ReloadStyle(1)<CR>")
H.nmap(',vr', ":TSToggle rainbow<CR>")
H.nmap(',vs', ":ScrollbarToggle<CR>")
H.nmap(',gr', ":call FocusBufOrDo('bootstrap.lua','e $mylua/bootstrap.lua')<CR>")
H.nmap(',ge', ":call FocusBufOrDo('remap.lua','e $mylua/remap.lua')<CR>")
-- H.nmap(',vp', function() vim.api.nvim_exec([[:put +| normal dfmxI'A',==]], false) end)
H.nmap(',vp', function() vim.api.nvim_exec([[:put +| normal df:3xdf/^v$S'A,==]], false) end)
-- H.nmap(',vt', function() require'tint'.toggle() end )
H.nmap(',vt', require'tint'.toggle)
H.nmap(',s', ":SymbolsOutline<CR>")
H.nmap(',j', require'treesj'.toggle)
-- vim.keymap.set('n', ',j', require('treesj').toggle)
-- H.nmap('q,', ":TSJJoin<CR>")
-- H.nmap('q.', ":TSJSplit<CR>")
H.nmap('d<', "<cmd>diffget //2<CR>")
H.nmap('d>', "<cmd>diffget //3<CR>")

local tele_ivy = require("telescope.themes").get_ivy{ sort_mru = true, layout_config = { height = vim.opt.lines:get() - 10 } }
function Tele_buff_ivy() require("telescope.builtin").buffers( tele_ivy ) end
local tele_drop = require("telescope.themes").get_dropdown{ sort_mru=true, winblend=9, layout_config = { height=21 } }
function Tele_buff_drop() require("telescope.builtin").buffers( tele_drop ) end

H.nmap(',fb', Tele_buff_ivy, "Telescope [B]uffers ivy-themed")
H.nmap(',h', Tele_buff_ivy, "Telescope [B]uffers ivy-themed")
H.nmap(',<space>', Tele_buff_drop)
H.nmap(',l', require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
-- nnoremap ,<space> :Telescope buffers sort_mru=1 theme=dropdown winblend=9<CR>
H.nmap(',fh', require("telescope.builtin").help_tags, "Telescope [F]ind [H]elp_tags")
H.nmap(',fz', require("telescope.builtin").diagnostics, "Telescope [F]ind Diagnostics")
H.nmap(',fo', require("telescope.builtin").oldfiles, "Telescope [F]ind [O]ld files")
H.nmap(',fr', require("telescope.builtin").lsp_references, "Telescope [F]ind [R]eferences")
H.nmap('qf', "<cmd> call GetProjDir() <bar> exec 'Telescope find_files cwd=' . expand(b:proj_dir)<CR>", "[F]ind my text [F]iles")
H.nmap(',/',  ":Telescope find_files search_dirs=$sh,$tt,$loc<CR>")
H.nmap(',,/', ":Telescope find_files theme=ivy search_dirs=$sh,$PWD")
H.nmap(',fg', ":Telescope live_grep theme=ivy<CR>")
H.nmap(',fd', ":Telescope live_grep theme=ivy search_dirs=%<CR>")
H.nmap(',fc', ":Telescope current_buffer_fuzzy_find theme=ivy<CR>")
H.nmap(',ff', ":Telescope find_files theme=ivy<CR>")
H.nmap('qr',  ":Telescope lsp_references theme=ivy<CR>")
H.nmap(',fs', ":Telescope lsp_document_symbols<CR>")
H.nmap('qs',  ":Telescope lsp_dynamic_workspace_symbols<CR>")
H.nmap(',vg', require("gitsigns").toggle_signs, "Show git highlight column")

-- nnoremap ,tt :Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout_config={"prompt_position":"top"}<CR>
-- nnoremap ,tt <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({sorting_strategy="ascending", theme="ivy"})<CR>

