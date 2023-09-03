return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local opts = {
      options = {
        diagnostics = "nvim_lsp",
        groups = {
          items = {
            require('bufferline.groups').builtin.pinned:with({ icon = "📌" })
          }
        }
      }
    }
    require('bufferline').setup(opts)

    vim.keymap.set({ 'n' }, '<leader>p', function() vim.cmd('BufferLineTogglePin') end, { desc = '[P]in buffer' })
  end,
}
