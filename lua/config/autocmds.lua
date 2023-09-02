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

local help_group = vim.api.nvim_create_augroup('Help', { clear = true })
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  callback = function()
    if vim.bo.filetype == 'man' then
      vim.keymap.set({ 'n', 'v' }, 'q', function() vim.api.nvim_buf_delete(0, {}) end)
    end
  end,
  group = help_group,
})
