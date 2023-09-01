return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.keymap.set("n", "<C-h>", function()
      vim.cmd("TmuxNavigateLeft")
    end, { silent = true })
    vim.keymap.set("n", "<C-l>", function()
      vim.cmd("TmuxNavigateRight")
    end, { silent = true })
    vim.keymap.set("n", "<C-j>", function()
      vim.cmd("TmuxNavigateDown")
    end, { silent = true })
    vim.keymap.set("n", "<C-k>", function()
      vim.cmd("TmuxNavigateUp")
    end, { silent = true })
  end,
}
