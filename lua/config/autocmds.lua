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
    if vim.bo.filetype == 'help' or vim.bo.filetype == 'quickfix' or vim.bo.filetype == 'fugitive' then
      vim.keymap.set({ 'n', 'v' }, 'q', function() vim.api.nvim_buf_delete(0, {}) end, { buffer = true })
    end
  end,
  group = quit_group,
})

-- enter insert mode by default for terminals
local term_group = vim.api.nvim_create_augroup('Term', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = function()
    if vim.bo.filetype == 'toggleterm' and vim.api.nvim_get_mode().mode == 'nt' then
      vim.cmd('startinsert')
    end
  end,
  group = term_group,
})
