-- [[ Setting options ]]
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- vim.o.colorcolumn = "80"

-- Spaces instead of tabs by default
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- trigger indent after we write "case", and when we backspace.
vim.opt.indentkeys:append { "<e>", "<BS>" }
vim.o.smartindent = true

-- so <C-a> doesn't treat "-n" as negative
vim.opt.nrformats:append { "unsigned" }
