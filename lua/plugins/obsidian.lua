local vault_path = vim.fn.expand '~/my/docs/sidequestboy'
return {
  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    tag = 'v1.13.0',
    event = {
      'BufReadPre ' .. vault_path .. '/**.md',
      'BufNewFile ' .. vault_path .. '/**.md',
    },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    opts = {
      dir = '~/my/docs/sidequestboy', -- no need to call 'vim.fn.expand' here
    },
  },
  {
    'oflisback/obsidian-sync.nvim',
    dev = true,
    dir = '~/my/code/nvim-plugins/obsidian-sync.nvim',
    branch = 'topic/apply-uriencode',
    opts = {
      vault_path = vault_path,
      obsidian_server_address = 'http://localhost:27123',
    },
  },
}
