-- vim: ts=2 sw=2

local M = {}
H = M
print('hello from plasmik.helpy lua')

function M.tprint (tbl)
  for k,v in pairs(tbl) do
    print(k,v)
  end
end

function M.unload (p)
  package.loaded[p] = nil
end

function M.reload (p)
  package.loaded[p] = nil
  require(p)
end

---Author: cseickel
---The file system path separator for the current platform.
M.path_separator = "/"
M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1
if M.is_windows == true then
  M.path_separator = "\\"
end
---Split string into a table of strings using a separator.
---@param inputString string The string to split.
---@param sep string The separator to use.
---@return table table A table of strings.
M.split = function(inputString, sep)
  local fields = {}
  local pattern = string.format("([^%s]+)", sep)
  local _ = string.gsub(inputString, pattern, function(c)
    fields[#fields + 1] = c
  end)
  return fields
end
---Joins arbitrary number of paths together.
---@param ... string The paths to join.
---@return string
M.path_join = function(...)
  local args = {...}
  if #args == 0 then
    return ""
  end
  local all_parts = {}
  if type(args[1]) =="string" and args[1]:sub(1, 1) == M.path_separator then
    all_parts[1] = ""
  end
  for _, arg in ipairs(args) do
    local arg_parts = M.split(arg, M.path_separator)
    vim.list_extend(all_parts, arg_parts)
  end
  return table.concat(all_parts, M.path_separator)
end

M.tableMerge = function(t1,t2)
  for k,v in pairs(t2) do
    t1[k] = v
  end
end

M.bram_nmap = function (a_key, a_map, a_opts )
  if type(a_opts or false) == "table" then
    M.tableMerge(a_opts or {}, {})
    -- M.tableMerge(a_opts or {}, {noremap=true})
  else
    a_opts = { noremap = true }
  end
  vim.api.nvim_set_keymap('n', a_key, a_map, a_opts)
end

M.nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc, noremap = true })
end
M.snmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc, noremap = true, silent = true })
end

-- local k_opts = { silent=true, noremap=false }
-- vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('bufjump').backward()<cr>", k_opts)

-- local hotfun = {}
M.teles_ff = function()
  local opt = require('telescope.themes').get_ivy({height=10,previewer=false,winblend=16})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
M.bram_nmap('<C-h>', ':lua require("plasmik.helpy").teles_ff()<cr>')
-- :lua package.loaded.init = nil
-- print("init.lua loaded once more")
-- return hotfun

M.mirror_buf_to_prev_window = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local pos = vim.fn.getpos('.')
  if vim.fn.winnr() == vim.fn.winnr('#') then
    -- only current window is present; add second window
    vim.cmd('vnew')
    -- vim.api.nvim_open_win(true,true,{})
  else
    -- go to prev window
    vim.cmd('wincmd p')
  end
  vim.api.nvim_set_current_buf(bufnr)
  vim.fn.setpos('.',pos)
end

return M

