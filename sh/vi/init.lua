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
-- vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('bufjump').backward()<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<C-n>", ":lua require('bufjump').forward()<cr>", opts)

-- vim.api.nvim_command('new')
-- vim.api.nvim_command('\
-- set scrolloff=3 |\
-- set scrolloff=2 |\
-- ')


------------------------
--       LSP:         --
------------------------

-- vim.lsp.set_log_level("debug")

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).

lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        -- vim.api.nvim_command('echom 88')
        opts = {
            -- cmd = { "~/.local/share/nvim/lsp_servers/sumneko_lua" },
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
    if server.name == "ccls" then
        -- opts.root_dir = function() print("ff") end
        opts.on_attach = function() print("ccls attached here!") end
    end
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- require('lspconfig').bashls.setup{
--     on_attach = function() print("lsp client is clangd")
--     end,
-- }


vim.api.nvim_command('\
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>|\
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>|\
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>|\
nnoremap <silent> gw <cmd>lua vim.lsp.buf.document_symbol()<CR>|\
nnoremap <silent> gw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>|\
nnoremap <silent> gR <cmd>lua vim.lsp.buf.references()<CR>|\
nnoremap <silent> gF <cmd>lua vim.lsp.buf.type_definitions()<CR>|\
nnoremap <silent>  K <cmd>lua vim.lsp.buf.hover()<CR>|\
nnoremap <silent> gK K|\
nnoremap <silent> <F7> <cmd>lua vim.lsp.buf.signature_help()<CR>|\
nnoremap <silent> <F5> k<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>|\
nnoremap <silent> <F6> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>|\
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)|\
')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end
nkeymap(',R', ':lua vim.lsp.buf.rename()<cr>')

