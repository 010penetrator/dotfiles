-- vim: ts=2 sw=2

-- Install lazy.nvim (the plugin manager) --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- local lazypath = vim.env.PLUGDIR .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins
require("lazy").setup(
  "mylazy",
  {
    root = vim.env.PLUGDIR,
    change_detection = { enabled = false }
  }
)

