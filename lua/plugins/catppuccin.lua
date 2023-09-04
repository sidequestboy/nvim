return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    integrations = {
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      noice = true,
      notify = true,
      -- neotree = true,
      semantic_tokens = true,
      -- telescope = true,
      treesitter = true,
      which_key = true,
    }
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { italic = true, fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { italic = true, fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { italic = true, fg = "#94e2d5" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { italic = true, fg = "#89dceb" })
  end,
}
