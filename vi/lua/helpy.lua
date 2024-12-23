-- vim: ts=2 sw=2

-- print('hello from helpy lua')

if not H then
  H = {}
end

function H.sayhello()
  print(12321)
  return '000'
end

H.highlit_cur = false

function H.get_version()
  -- local major = vim.version().major
  local bild = vim.version().build
  print(vim.inspect(vim.version()))
  -- print(bild, type(bild))
  local bildnum = (tonumber(bild,26))
  print(bildnum)
  return bildnum
end

function H.logo()
  -- os.execute('echo 111')
  -- local output = vim.fn.system { 'echo', 'hi' }
  local output = vim.fn.system { 'bash', '$dotfiles/vi/logo/nvim-logo', '-b' }
  return output
end

--[[ function H.auxfun1()
  return require("nvim-possession").status()
end ]]

H.vidir = os.getenv('sh') .. '/vi/'

function H.tele_ivy_theme_arg(dir)
    return require'telescope.themes'.get_ivy {
        sort_mru = true,
        layout_config = { height = vim.opt.lines:get() - 10 },
        cwd = dir or require'telescope.utils'.buffer_dir(),
    }
end

function H.is_git_repo()
  local is_repo = vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end

function H.get_git_root(path)
  if not path then
    -- path = vim.api.nvim_buf_get_name(0)
    path = vim.fn.expand("%:p:h")
  end
  local pre_cmd = "cd " .. path .. " ; "
  local git_root = vim.fn.system(pre_cmd .. "git rev-parse --show-toplevel")
  if
    vim.v.shell_error ~= 0
  then
    return nil
  else
    return string.gsub(git_root, "[\n\r]", '')
  end
end

function H.condMkdir(base,dir)
  local targ = base .. H.path_separator .. dir
  -- print('targ is ' , targ)
  if
    vim.fn.getftype(targ) == "dir"
  then
    return targ
  else
    local res =  vim.fn.mkdir(targ, "p")
    if res then
      return targ
    else
      -- Bad result
      return "/"
    end
  end
end
-- print( H.condMkdir(os.getenv("HOME"),"08"))

-- Print table
function H.Tprint (tbl)
  if not tbl then print(tbl) return "" end
  for k,v in pairs(tbl) do
    print(k,v)
  end
end

-- Print almost any object
function H.Uprint (input, indent)
  if not input then print(input) return "" end
  if not indent then indent = 0 end
  local format = string.rep("  ", indent)
  --
  if type(input) == "table" then
    print(format .. tostring(input) .. '\n')
    -- print(formatting .. input )
    for _,val in pairs(input) do
      H.Uprint(val,indent+1)
    end
  elseif type(input) == "function" then
    print(format .. "func: " .. input .. '\n')
  else
    print(format .. type(input) .. ":  " .. input .. '\n')
  end
end

--[[ function H.uprint (input, indent)
--older
  if not input then print(input) return "" end
  -- if not
  if not indent then indent = 1 end
  for k,v in pairs(input) do
    -- local formatting = string.rep("  ", indent) .. k .. ": "
    local formatting = string.rep("  ", indent)
    if type(v) == "table" then
      print(formatting .. k .. ": ")
      H.uprint(v, indent+1)
    elseif type(v) == "function" then
      print(formatting .. type(v) .. " " .. k )
    else
      print(3)
      print(formatting .. type(v) .. v)
    end
  end
end ]]



function H.unload (p)
  package.loaded[p] = nil
end

function H.reload (p)
  package.loaded[p] = nil
  require(p)
end

function H.reset (p)
  package.loaded[p] = nil
  require(p).setup()
end

function H.try_require(a)
  local ok, err = pcall(require, a)
  if not ok then
    return nil, err
  else
    return ok, err
  end
end

function H.reqsetup(p)
  local pl = H.try_require(p)
  if pl then
    require(p).setup()
  else
    print('cant load that plugin..')
  end
end

--[[ H.tableMerge = function(tSrc,tDest)
  for k,v in pairs(tDest) do
    tSrc[k] = v
  end
end ]]

function H.tableMerge(t1, t2)
  for k,v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        H.tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

---Author: cseickel
---The file system path separator for the current platform.
H.path_separator = "/"
H.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1
if H.is_windows == true then
  H.path_separator = "\\"
end
---Split string into a table of strings using a separator.
---@param inputString string The string to split.
---@param sep string The separator to use.
---@return table table A table of strings.
function H.split(inputString, sep)
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
function H.path_join(...)
  local args = {...}
  if #args == 0 then
    return ""
  end
  local all_parts = {}
  if type(args[1]) =="string" and args[1]:sub(1, 1) == H.path_separator then
    all_parts[1] = ""
  end
  for _, arg in ipairs(args) do
    local arg_parts = H.split(arg, H.path_separator)
    vim.list_extend(all_parts, arg_parts)
  end
  return table.concat(all_parts, H.path_separator)
end

-- classic Vim keymap, it may take options like "silent"
function H.Bmap (a_key, a_map, a_opts )
  if type(a_opts or false) == "table" then
    H.tableMerge(a_opts or {}, {})
    -- H.tableMerge(a_opts or {}, {noremap=true})
  else
    a_opts = { noremap = true }
  end
  vim.api.nvim_set_keymap('n', a_key, a_map, a_opts)
end

function H.mapfuncwrap(input)
  local funcname
  local args
  if type(input) == "string" then
    -- it is an old Vim command string
    return input
  elseif type(input) == "table" then
    -- print("mpf input", vim.inspect(input))
    funcname = table.remove(input, 1)
    args = input
    -- print("args_size", #args)
    -- print("funcname", funcname)
    -- print("args", table.unpack(args))
    return function()
      funcname(table.unpack(args))
    end
  elseif type(input) == "function" then
    return input
  else
    print("wtf is that map action?")
  end
end


function H.nmap(keys, func, desc)
  vim.keymap.set('n', keys, H.mapfuncwrap(func), { desc = desc or " ", noremap = true })
end

function H.tmap(keys, func, desc)
  vim.keymap.set('t', keys, H.mapfuncwrap(func), { desc = desc or " ", noremap = true })
end

function H.snmap(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc or " ", noremap = true, silent = true })
end
function H.xnmap(keys, func, desc)
  vim.keymap.set({'n','x'}, keys, func, { desc = desc or " ", noremap = true })
end
function H.vmap(keys, func, desc)
  vim.keymap.set({'v'}, keys, func, { desc = desc or " ", noremap = true })
end
function H.nvmap(keys, func, desc)
  vim.keymap.set({'n','v'}, keys, func, { desc = desc or " ", noremap = true })
end

-- local hotfun = {}
-- :lua package.loaded.init = nil
-- print("init.lua loaded once more")
-- return hotfun

function H.rot_line()
  vim.cmd[[ silent exec "normal 0y$" ]]
  local line = vim.fn.getreg('"')
  line = require'rot13'.decipher(line)
  vim.fn.setreg('+', line)
  vim.fn.setreg('*', line)
  print("rrr")
end

function H.eval_paragraph()
  local filetype = vim.bo.filetype
  local lastpos = vim.api.nvim_win_get_cursor(0)[1]
  vim.cmd[[ silent exec "normal yap" ]]
  vim.cmd.exec(lastpos)
  local code = vim.fn.getreg('"')
  -- print("code is", code)
  if filetype == 'lua' then
    assert(load(code))()
    print("Evaluated current paragraph as Lua.")
  elseif filetype == 'vim' then
    -- vim.cmd[[ @" ]]
    vim.api.nvim_exec2(code, {})
    -- vim.api.nvim_exec2(code, {output=false})
    print("Evaluated current paragraph as VimScript.")
  end
  -- print('lol')
end

function H.mirror_buf_to_prev_window()
  local bufnr = vim.api.nvim_get_current_buf()
  local winnr = vim.api.nvim_get_current_win()
  local pos = vim.fn.getpos('.')
  vim.cmd('wincmd p') -- go to prev window
  local winnr2 = vim.api.nvim_get_current_win()
  -- if vim.fn.winnr() == vim.fn.winnr('#') then
  if winnr == winnr2 then
    -- print(1)
    -- only current window is present
    vim.cmd('vnew') -- add second window
    -- vim.api.nvim_open_win(true,true,{})
  else
    -- print(2)
  end
  vim.api.nvim_set_current_buf(bufnr)
  vim.fn.setpos('.',pos)
end

--- Check if a plugin is defined in lazy. Useful with lazy loading
--- when a plugin is not necessarily loaded yet.
---@param plugin string The plugin to search for.
---@return boolean available # Whether the plugin is available.
function H.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  -- H.tprint(lazy_config.plugins)
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end


-- return H

