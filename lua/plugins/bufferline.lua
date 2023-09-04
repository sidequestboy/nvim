return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  after = "catppuccin",
  config = function()
    local error_sign = vim.fn.sign_getdefined("DiagnosticSignError")[1].text or "󰅚"
    local warning_sign = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text or "󰀪"

    local opts = {
      options = {
        -- sort_by = "insert_after_current",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if (level:match("error")) then
            return error_sign
          elseif (level:match("warning")) then
            return warning_sign
          else
            return ""
          end
        end,
        groups = {
          items = {
            require('bufferline.groups').builtin.pinned:with({ icon = "📌" })
          }
        }
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
      })
    }
    require('bufferline').setup(opts)

    vim.keymap.set({ 'n' }, '<leader>p', function() vim.cmd('BufferLineTogglePin') end, { desc = '[P]in buffer' })
  end,
}
