local vault_path = vim.fn.expand '~' .. '/my/docs/sidequestboy'
return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  -- event = {
  --   "BufReadPre " .. vault_path .. "/**.md",
  --   "BufNewFile " .. vault_path .. "/**.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    dir = vault_path,
    mappings = {},
  },
  keys = {
    {
      '<leader>so',
      function()
        vim.cmd 'ObsidianQuickSwitch'
      end,
      desc = '[S]earch [O]bsidian',
    },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)
    vim.keymap.set('n', 'gf', function()
      if require('obsidian').util.cursor_on_markdown_link() then
        return ':ObsidianFollowLink<cr>'
      else
        return 'gf'
      end
    end, { noremap = false, expr = true })
  end,
}
