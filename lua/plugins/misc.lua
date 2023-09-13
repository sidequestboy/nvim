return {

  {
    'glepnir/nerdicons.nvim',
    cmd = 'NerdIcons',
    config = function()
      require('nerdicons').setup {}
      vim.keymap.set({ 'n' }, '<leader>i', function()
        vim.cmd 'NerdIcons'
      end, { desc = 'Nerd [i]cons' })
    end,
  },
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set({ 'n' }, '<leader>G', '<cmd>Git | only<cr>', { silent = true, desc = 'fu[G]itive' })
    end,
  },
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '│' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>gph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dir = '~/my/code/nvim-plugins/lualine.nvim',
    dev = true,
    priority = 999,
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_b = {
          'branch',
          'diff',
          { 'diagnostics', sources = { 'nvim_diagnostic' } },
        },
      },
      extensions = {
        'fugitive',
        'neo-tree',
        'quickfix',
        'toggleterm',
        'man',
        'nvim-dap-ui',
        'lazy',
        'fzf',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      local opts = {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
      require('Comment').setup(opts)
    end,
  },
  {
    'declancm/maximize.nvim',
    opts = { default_keymaps = false },
    config = function(_, opts)
      require('maximize').setup(opts)
      vim.keymap.set('n', '<leader>o', function()
        require('maximize').toggle()
      end, { desc = 'make [O]nly window' })
    end,
  },
  { 'echasnovski/mini.ai', version = '*' },
}
