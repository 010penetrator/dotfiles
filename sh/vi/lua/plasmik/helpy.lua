-- vim: ts=2 sw=2
-- H is the door

H = {}

local M = H

function M.tprint (tbl)
    for k,v in pairs(tbl) do
        print(k,v)
    end
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
    arg_parts = M.split(arg, M.path_separator)
    vim.list_extend(all_parts, arg_parts)
  end
  return table.concat(all_parts, M.path_separator)
end

local keymap = vim.api.nvim_set_keymap
local a_opts = { noremap = true }
local function nkeymap(a_key, a_map)
  keymap('n', a_key, a_map, a_opts)
end
M.nkeymap = nkeymap

-- local hotfun = {}
M.teles_ff = function()
  local opt = require('telescope.themes').get_ivy({height=10,previewer=false,winblend=16})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
-- nkeymap('<C-h>', ':lua require("init").teles_ff()<cr>')
nkeymap('<C-h>', ':lua require("plasmik.helpy").teles_ff()<cr>')
-- :lua package.loaded.init = nil
-- print("init.lua loaded once more")
-- return hotfun

return M

