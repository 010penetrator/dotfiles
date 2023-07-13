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

-- local navic = require("nvim-navic")
-- -- local navbuddy = H.mrequire("nvim-navbuddy")
-- require("lspconfig").clangd.setup {
--   on_attach = function(client, bufnr)
--     print("lsp client is clangd")
--     if client.server_capabilities.documentSymbolProvider then
--       navic.attach(client,bufnr)
--       print("navic attached!")
--     end
--     -- navbuddy.attach(client, bufnr)
--   end
-- }

--[[ require("lspconfig").bashls.setup { on_attach = function() print("lsp client is bashls") end, }
require("lspconfig").pyright.setup { on_attach = function() print("lsp client is pyright") end, capabilities = nc_capabilities }
require("lspconfig").cmake.setup { on_attach = function() print("lsp client is cmake") end, capabilities = nc_capabilities }
require("lspconfig").vimls.setup { on_attach = function() print("lsp client is vimls") end, capabilities = nc_capabilities } ]]

-- blc = require("lspconfig").bashls.cmd


local lspz = require("lsp-zero").preset({})
lspz.on_attach( function(client,bufnr)
  lspz.default_keymaps({buffer = bufnr})
  print("lsp-zero here")
  -- require("nvim-navbuddy").attach(client, bufnr)
  require("nvim-navic").attach(client,bufnr)
  -- print("lsp client is clangd;  ", "navbuddy & navic attached!")
end)
--
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lspz.nvim_lua_ls())
--
lspz.setup()

--[[ require("lspconfig").lua_ls.setup {
  on_attach = function() print("lsp client is lua_ls") end,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = { os.getenv("VIMRUNTIME") } },
    }
  },
} ]]

require("lsp_lines").setup()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({ virtual_text = false, })

--------------------------------
--         Completion:        --
--------------------------{{{}}}

vim.opt.completeopt={"menu", "noselect"}
-- vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

--[[ local cmp_mappings = lspz.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-t>"] = cmp.mapping.complete(),
  ["<C-c>"] = cmp.mapping.abort(),
}) ]]

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  --[[ mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  } ]]
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-e>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  },
  -- sources = cmp.config.sources({ }, { { name = 'buffer' } )
}

--[[ -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
      { name = 'buffer' },
    })
}) ]]

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--     sources = {
--     { name = 'buffer' }
--     }
-- })
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--     { name = 'path' }
--     },
--     { { name = 'cmdline' } })
-- })

