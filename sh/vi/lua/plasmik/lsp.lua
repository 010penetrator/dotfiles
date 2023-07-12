-- vim: ts=2 sw=2

--------------------------------
--           LSP:             --
--------------------------{{{}}}

-- vim.lsp.set_log_level("debug")

--[[ local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
-- lsp_installer.joke =  vim.fn.stdpath "config" .. "/lsp_servers"
lsp_installer.settings({
        install_root_dir =  vim.fn.stdpath "config" .. "/lsp_servers",
     })
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.capabilities = capabilities
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
end) ]]

local masonpath
if vim.env.PLUGDIR then
  masonpath = H.path_join( vim.env.PLUGDIR , "..", "nvim-mason" )
  -- masonpath = H.path_join( vim.fn.stdpath"data", "nvim-mason" )
  masonpath = vim.fn.resolve(masonpath)
end

require("mason").setup {
  install_root_dir = masonpath,
}

H.msetup("mason-nvim-dap")

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "bashls", "clangd", "pyright", "cmake", "vimls" }
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
local nc_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").bashls.setup {
  on_attach = function()
    print("lsp client is bashls")
  end,
}

require("lspconfig").clangd.setup {
  on_attach = function(client, bufnr)
    print("lsp client is clangd")
    -- local navbuddy = H.mrequire("nvim-navbuddy")
    -- local navic = H.mrequire("nvim-navic")
    require("nvim-navbuddy").attach(client, bufnr)
    require("nvim-navic").attach(client,bufnr)
    print("navbuddy attached!")
  end,
}

require("lspconfig").pyright.setup { on_attach = function() print("lsp client is pyright") end, capabilities = nc_capabilities }
require("lspconfig").cmake.setup { on_attach = function() print("lsp client is cmake") end, capabilities = nc_capabilities }
require("lspconfig").vimls.setup { on_attach = function() print("lsp client is vimls") end, capabilities = nc_capabilities }

-- blc = require("lspconfig").bashls.cmd

require("lsp_lines").setup()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({ virtual_text = false, })

local lsp = require("lsp-zero").preset({})
lsp.on_attach( function(client,bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

--[[ require("lspconfig").lua_ls.setup {
  on_attach = function() print("lsp client is lua_ls") end,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = { os.getenv("VIMRUNTIME") } },
    }
  },
} ]]

