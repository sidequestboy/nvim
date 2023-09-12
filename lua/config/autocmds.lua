-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- quit with 'q' in help pages, quickfix, fugitive
local quit_group = vim.api.nvim_create_augroup('EasyQuit', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = function()
    if vim.bo.filetype == 'help' or vim.bo.filetype == 'qf' or vim.bo.filetype == 'fugitive' then
      vim.keymap.set({ 'n', 'v' }, 'q', function()
        vim.api.nvim_buf_delete(0, {})
      end, { buffer = true })
    end
  end,
  group = quit_group,
})

local session_group = vim.api.nvim_create_augroup('Session', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    if vim.fn.argc() == 0 then
      require('persistence').load()
    end
  end,
  nested = true,
  group = session_group,
})

local filetype_group = vim.api.nvim_create_augroup('Filetype', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead' }, {
  callback = function()
    vim.cmd 'set filetype=javascriptreact'
  end,
  pattern = '*src/*.js',
  group = filetype_group,
})

local auto_normal_group = vim.api.nvim_create_augroup('NormalGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = function()
    if vim.bo.filetype == 'help' or vim.bo.filetype == 'fugitive' then
      vim.cmd 'stopinsert'
    end
  end,
  group = auto_normal_group,
})

-- enter insert mode by default for terminals and gitcommit
local insert_group = vim.api.nvim_create_augroup('AutoInsert', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = function()
    if vim.bo.filetype == 'toggleterm' and vim.api.nvim_get_mode().mode == 'nt' or vim.bo.filetype == 'gitcommit' then
      vim.cmd 'startinsert'
    end
  end,
  group = insert_group,
})
