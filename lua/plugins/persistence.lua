return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = { options = { "buffers", "terminal", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } }
}
