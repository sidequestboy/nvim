-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    enable_diagnostics = true,
    sources = { "filesystem", "document_symbols" },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    vim.keymap.set('n', '<leader>dS',
      function() vim.cmd("Neotree source=document_symbols reveal=true position=right toggle=true") end,
      { desc = '[n]eotree toggle [d]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>f',
      function() vim.cmd("Neotree source=filesystem reveal=true position=left toggle=true") end,
      { desc = 'Neotree toggle filesystem' })
    vim.keymap.set('n', '<leader>t',
      function() vim.cmd("Neotree position=left toggle=true") end,
      { desc = 'Neo[t]ree toggle' })
  end,
}
