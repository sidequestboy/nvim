return {
  'sbdchd/neoformat',
  config = function()
    local auto_format_enabled = true
    vim.api.nvim_create_user_command("AutoFormatEnable", function()
      auto_format_enabled = true
      print("Auto format enabled.")
    end, {})
    vim.api.nvim_create_user_command("AutoFormatDisable", function()
      auto_format_enabled = false
      print("Auto format disabled.")
    end, {})
    vim.api.nvim_create_user_command("AutoFormatToggle", function()
      if auto_format_enabled then
        vim.cmd("AutoFormatDisable")
      else
        vim.cmd("AutoFormatEnable")
      end
    end, {})

    local augroup = vim.api.nvim_create_augroup('fmt', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      group = augroup,
      pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.css', '*.html' },
      callback = function()
        if auto_format_enabled then
          vim.cmd 'Neoformat prettierd'
        end
      end,
    })
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      group = augroup,
      pattern = { '*.lua' },
      callback = function()
        if auto_format_enabled then
          vim.cmd 'Neoformat stylua'
        end
      end,
    })
  end,
}
