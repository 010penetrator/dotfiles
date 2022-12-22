-- vim: ts=4 sw=4
-- FYI: Use checkhealth to troubleshoot Neovim

local mp
if vim.env.PLUGD then
    -- mp = vim.env.PLUGD .. H.path_separator .. "nvim-mason"
    mp = H.path_join( vim.env.PLUGD , "..", "nvim-mason" )
    mp = vim.fn.resolve(mp)
    -- mp = H.path_join( vim.fn.stdpath "data", "nvim-mason" )
    -- print(mp)
end
require("mason").setup({
    install_root_dir = mp ,
})

-- require("mason-lspconfig").setup()
require("mason-lspconfig").setup({
    -- ensure_installed = { "sumneko_lua", "clangd" }
    ensure_installed = { "sumneko_lua", "bashls", "clangd", "pyright", "cmake", "vimls" }
})
require('lspconfig').bashls.setup{ on_attach = function() print("lsp client is bashls") end, }
require('lspconfig').clangd.setup{ on_attach = function() print("lsp client is clangd") end, }
require('lspconfig').sumneko_lua.setup{
    on_attach = function() print("lsp client is sumneko_lua") end,
    settings = { Lua = { diagnostics = { globals = {'vim'}}}},
    }
require('lspconfig').pyright.setup{ on_attach = function() print("lsp client is pyright") end, }
require('lspconfig').cmake.setup{ on_attach = function() print("lsp client is cmake") end, }
require('lspconfig').vimls.setup{ on_attach = function() print("lsp client is vimls") end, }

blc = require('lspconfig').bashls.cmd

require('nvim-autopairs').setup{}
require('Comment').setup()
-- require('yode-nvim').setup()

require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<c-a>"] = function() print("tryitout") end,
            }
        }
    }
}
require('telescope').load_extension('fzf')

--[[ require('eval').setup{
    -- prefix_char = "> ", -- char displayed before the output content
    -- a table with each filetype and its respective command to run code
    filetype = {
        lua = { cmd = "lua" },
        sh = { cmd = "bash" },
        python = { cmd = "python" },
        javascript = { cmd = "node" },
    }
} ]]

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- require"nvim-tree".open_replacing_current_buffer()
require("nvim-tree").setup({
    disable_netrw = false,
    hijack_netrw = false,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

function nvtree_toggle_replace()
    local view = require"nvim-tree.view"
    local api = require"nvim-tree.api"
    if view.is_visible() then
        api.tree.focus()
    else
        api.tree.toggle()
        -- require"nvim-tree".open_replacing_current_buffer()
    end
end

function nvtree_imit_netrw()
    local curname=vim.api.nvim_buf_get_name(0)
    print(curname)
    if curname=="" then
        print "var1"
        vim.cmd"e ."
    --     require"nvim-tree".open_replacing_current_buffer()
    --     print "var1"
    -- else
    --     require"nvim-tree".open_replacing_current_buffer()
    --     print "var2"
    end
    local view = require"nvim-tree.view"
    local api = require"nvim-tree.api"
    if view.is_visible() then
        api.tree.focus()
        api.tree.find_file(curname)
    else
        require"nvim-tree".open_replacing_current_buffer()
    end
end

require"nvim-treesitter.configs".setup {
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

-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
require('indent_blankline').setup {
    show_end_of_line = true,
    show_current_context = false,
    show_current_context_start = true,
    indent_blankline_enabled = false,
    enabled = false,
    char = '░',
    context_char = '│'
}
-- vim.g.indent_blankline_enabled = false
-- let g:indent_blankline_char = '⋮'

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=12, upper=18, builtin=8, bookmark=25 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = ""
  },
  mappings = {
        toggle = "m.",
        delete_line = "m-",
        delete_bookmark = "m=",
        next_bookmark = "s<Down>",
        prev_bookmark = "s<Up>",
        next = "a<Down>",
        prev = "a<Up>",
        next_bookmark1 = "1<Down>",
        prev_bookmark1 = "1<Up>",
        next_bookmark2 = "2<Down>",
        prev_bookmark2 = "2<Up>",
        next_bookmark3 = "3<Down>",
        prev_bookmark3 = "3<Up>",
        next_bookmark4 = "4<Down>",
        prev_bookmark4 = "4<Up>",
    }
}


-- n  m]          * <Cmd>lua require'marks'.next()<CR>
-- n  f<Up>       * <Cmd>lua require'marks'.prev_bookmark()<CR>

require('toggleterm').setup {
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = 'horizontal',
    size = 25,
}

require('neoscroll').setup({
    easing_function = "circular",
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'}
})
local t = {}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '400', [['cubic']]}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '400', [['cubic']]}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '600', [['circular']]}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '600', [['circular']]}}
-- t['<C-y>'] = {'scroll', { -4, 'false', '250', "quadratic"}}
-- t['<C-e>'] = {'scroll', {  4, 'false', '250', "quadratic"}}
t['zt']    = {'zt', {'100'}}
t['zz']    = {'zz', {'100'}}
t['zb']    = {'zb', {'100'}}
require('neoscroll.config').set_mappings(t)


-- local k_opts = { silent=true, noremap=false }
-- vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('bufjump').backward()<cr>", k_opts)
-- vim.api.nvim_set_keymap("n", "<C-n>", ":lua require('bufjump').forward()<cr>", k_opts)

-- vim.api.nvim_command('new')
-- vim.api.nvim_command('\
-- set scrolloff=3 |\
-- set scrolloff=2 |\
-- ')

------------------------
--       LSP:         --
------------------------

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

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

if vim.fn.has('nvim-0.6') == 1 then
    vim.api.nvim_command('\
    nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>|\
    nnoremap <silent> gK K|\
    nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>|\
    nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>|\
    nnoremap <silent> gS <cmd>lua vim.lsp.buf.document_symbol()<CR>|\
    nnoremap <silent> gs <cmd>lua vim.lsp.buf.references()<CR>|\
    nnoremap <silent> gw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>|\
    nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>|\
    nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>|\
    nnoremap <silent> gh <cmd>ClangdSwitchSourceHeader<CR>|\
    nnoremap <silent> z<Down> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>|\
    nnoremap <silent> z<Up> k<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>|\
    nnoremap <silent> ,S <cmd>lua vim.lsp.buf.signature_help()<CR>|\
    autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)|\
')
end

if vim.fn.has('nvim-0.7') == 1 then
    -- print("Nvim is cutting edge new")
    -- vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","gH", vim.lsp.buf.hover)
    vim.keymap.set("n","gK", "K")
    vim.keymap.set("n","gd", vim.lsp.buf.definition)
    -- vim.keymap.set("n","gv", function() vim.cmd('new') end )
    vim.keymap.set("n","gv", "<cmd>vsplit <bar> lua vim.lsp.buf.definition()<CR>" )
    vim.keymap.set("n","gl", "<cmd>let bn=bufnr('%') <bar> let pos=getpos('.') <bar> wincmd p <bar> exec 'b' . bn <bar> call setpos('.',pos) <bar> lua vim.lsp.buf.definition()<CR>" )
    -- let g:bufnra = bufnr("%")    exec "b" . g:bufnra
    vim.keymap.set("n","gD", vim.lsp.buf.declaration)
    vim.keymap.set("n","gs", vim.lsp.buf.document_symbol)
    vim.keymap.set("n","gr", vim.lsp.buf.references)
    vim.keymap.set("n","gw", vim.lsp.buf.workspace_symbol)
    vim.keymap.set("n","gy", vim.lsp.buf.type_definition)
    vim.keymap.set("n","gi", vim.lsp.buf.implementation)
    vim.keymap.set("n","z<down>", vim.diagnostic.goto_next)
    vim.keymap.set("n","z<up>", vim.diagnostic.goto_prev)
    vim.keymap.set("n",",r", vim.lsp.buf.rename)
    vim.keymap.set("n","qa", vim.lsp.buf.code_action)
    vim.keymap.set("n","-", nvtree_imit_netrw)
end

local keymap = vim.api.nvim_set_keymap
local a_opts = { noremap = true }
local function nkeymap(a_key, a_map)
    keymap('n', a_key, a_map, a_opts)
end
nkeymap(',R', ':lua vim.lsp.buf.rename()<cr>')

------------------------
--     Completion:    --
------------------------

vim.opt.completeopt={"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
        })
})

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
--     }, {
--         { name = 'cmdline' }
--         })
-- })

local hotfun = {}
hotfun.teles_ff = function()
    local opt = require('telescope.themes').get_ivy({height=10,previewer=false,winblend=16})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
-- nkeymap('<C-h>', ':lua require("init").teles_ff()<cr>')
nkeymap('<C-h>', ':lua require("init").teles_ff()<cr>')
-- :lua package.loaded.init = nil
-- print("init.lua loaded once more")
return hotfun
