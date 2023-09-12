return {
  'sbdchd/neoformat',
  config = function()
    local augroup = vim.api.nvim_create_augroup("fmt", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePre" },
      {
        group = augroup,
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.html" },
        callback = function()
          vim.cmd("Neoformat prettierd")
        end
      })
    vim.api.nvim_create_autocmd({ "BufWritePre" },
      {
        group = augroup,
        pattern = { "*.lua" },
        callback = function()
          vim.cmd("Neoformat stylua")
        end
      })
  end,
}
