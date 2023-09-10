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
      vim.keymap.set({ 'n', 'v' }, 'q', function() vim.api.nvim_buf_delete(0, {}) end, { buffer = true })
    end
  end,
  group = quit_group,
})

-- enter insert mode by default for terminals and gitcommit
local insert_group = vim.api.nvim_create_augroup('AutoInsert', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = function()
    if vim.bo.filetype == 'toggleterm' and vim.api.nvim_get_mode().mode == 'nt' or vim.bo.filetype == 'gitcommit' then
      vim.cmd('startinsert')
    end
  end,
  group = insert_group,
})

local session_group = vim.api.nvim_create_augroup('Session', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    if (vim.fn.argc() == 0) then
      require("persistence").load()
    end
  end,
  nested = true,
  group = session_group
})

local filetype_group = vim.api.nvim_create_augroup('Filetype', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead' }, {
  callback = function()
    vim.cmd('set filetype=javascriptreact')
  end,
  pattern = "*src/*.js",
  group = filetype_group,
})

local is_stale = true
local cur_char = ""

local indent_group = vim.api.nvim_create_augroup('Indent', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertCharPre' }, {
  callback = function()
    is_stale = false
    cur_char = vim.v.char
  end,
})
vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
  callback = function()
    -- only run when inserting non-whitespace
    if (is_stale ~= true and cur_char ~= "" and cur_char:match("%s") == nil) then
      is_stale = true
      -- local line_length = #vim.fn.getline(".")
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      local line_length = #vim.api.nvim_buf_get_lines(0, cursor_pos[1] - 1, cursor_pos[1], true)
      vim.cmd.execute("\"normal ==\"")
      local new_line_length = #vim.api.nvim_buf_get_lines(0, cursor_pos[1] - 1, cursor_pos[1], true)
      vim.api.nvim_win_set_cursor(0, { cursor_pos[1], cursor_pos[2] + new_line_length - line_length })
    end
  end,
  pattern = "*",
  group = indent_group,
})
