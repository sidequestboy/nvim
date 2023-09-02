vim.diagnostic.config({
  virtual_text = {
    source = true,
    prefix = '●',
  },
})

vim.cmd([[
  sign define DiagnosticSignError text=󰅚 texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text=󰀪 texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignInfo text=󰋽 texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignHint text=󰌶 texthl=DiagnosticSignHint linehl= numhl=
]])

