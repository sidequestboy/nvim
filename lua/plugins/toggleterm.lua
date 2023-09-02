return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = { size = 20, shade_terminals = true, shading_factor = -15 },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    vim.keymap.set({ "n", "t" }, "<C-t>", function()
      return "<cmd>" .. vim.v.count .. "ToggleTerm<cr>"
    end, { silent = true, expr = true })
  end,
}
-- vim.cmd(vim.v.count .. "ToggleTerm")
