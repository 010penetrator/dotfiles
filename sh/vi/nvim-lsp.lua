
local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).

lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
-- vim.api.nvim_command('echom 88')
        opts = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim', 'use' }
                    },
                }
            }
        }
    end
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)


vim.api.nvim_command('\
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR> |\
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR> |\
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR> |\
nnoremap <silent> gw <cmd>lua vim.lsp.buf.document_symbol()<CR> |\
nnoremap <silent> gw <cmd>lua vim.lsp.buf.workspace_symbol()<CR> |\
nnoremap <silent> gR <cmd>lua vim.lsp.buf.references()<CR> |\
nnoremap <silent> gF <cmd>lua vim.lsp.buf.type_definitions()<CR> |\
nnoremap <silent>  K <cmd>lua vim.lsp.buf.hover()<CR> |\
nnoremap <silent> gK K |\
nnoremap <silent> <F7> <cmd>lua vim.lsp.buf.signature_help()<CR> |\
nnoremap <silent> <F5> k<cmd>lua vim.lsp.diagnostic.goto_prev()<CR> |\
nnoremap <silent> <F6> <cmd>lua vim.lsp.diagnostic.goto_next()<CR> |\
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100) |\
')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end
nkeymap(',R', ':lua vim.lsp.buf.rename()<cr>')

