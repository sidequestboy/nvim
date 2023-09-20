return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
    'FelipeLema/cmp-async-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    -- this loads friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
    -- this loads my custom snippets
    require('luasnip.loaders.from_vscode').lazy_load {
      paths = { './snippets' },
    }
    luasnip.config.setup {}

    local cmp_opts = {
      experimental = { ghost_text = true },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
          end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'async_path' },
      },
    }

    cmp.setup(cmp_opts)
  end,
}
