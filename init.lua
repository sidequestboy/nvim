vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('config')
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('lazy').setup('plugins', {
  install = {
    missing = true,
    colorscheme = { "catppuccin" },
  },
})

-- vim: ts=2 sts=2 sw=2 et
