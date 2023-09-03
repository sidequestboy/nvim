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

require('config.options')
require('config.keymaps')
require('lazy').setup('plugins', {
  install = {
    missing = true,
    colorscheme = { "catppuccin" },
  },
})
require('config')
require('config.autocmds')

-- vim: ts=2 sts=2 sw=2 et
