return {
    'sbdchd/neoformat',
    config = function()
        local augroup = vim.api.nvim_create_augroup("fmt", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePre" },
            {
                group = augroup,
                pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
                callback = function()
                    vim.cmd("Neoformat prettierd")
                end
            })
    end,
}
