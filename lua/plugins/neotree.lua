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
  after = {
    "catppuccin"
  },
  opts = {
    enable_diagnostics = true,
    sources = { "filesystem", "document_symbols" },
    default_component_configs = {
      git_status = {
        symbols = {
          modified = "",
        },
      },
      modified = {
        symbol = "+",
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#fab388", italic = true })
    vim.api.nvim_set_hl(0, "NeoTreeModified", { link = "NeoTreeGitModified" })
  end,

  keys = {
    {
      '<leader>dS',
      function()
        vim.cmd("Neotree source=document_symbols reveal=true position=right toggle=true")
      end,
      desc = '[n]eotree toggle [d]ocument [S]ymbols',
    },
    {
      '<leader>f',
      function()
        vim.cmd("Neotree source=filesystem reveal=true position=left toggle=true")
      end,
      desc = 'Neotree toggle filesystem',
    },
    {
      '<leader>t',
      function() vim.cmd("Neotree position=left toggle=true") end,
      desc = 'Neo[t]ree toggle',
    },
  }
}
