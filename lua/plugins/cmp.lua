-- this is a failed experiment I think :(
local setup_autocmds = function()
  local cmp = require('cmp')
  local is_stale = true
  local cur_char = ""

  local indent_group = vim.api.nvim_create_augroup('Indent', { clear = true })
  vim.api.nvim_create_autocmd({ 'InsertCharPre' }, {
    callback = function()
      is_stale = false
      cur_char = vim.v.char
    end,
  })
  local cmp_was_visible
  local line_length
  local row, col
  vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
    callback = function()
      -- only run when inserting non-whitespace
      if (is_stale ~= true and cur_char ~= "" and cur_char:match("%s") == nil) then
        is_stale = true
        -- cmp_was_visible = cmp.visible()
        line_length = #vim.fn.getline(".")
        row, col = unpack(vim.api.nvim_win_get_cursor(0))

        -- if (cmp_was_visible) then
        --   cmp.abort() -- escape completion menu
        -- end

        vim.fn.execute("normal ==") -- autoindent line

        -- if (cmp_was_visible) then
        --   cmp.complete() -- open completion menu
        -- end

        vim.api.nvim_win_set_cursor(0, { row, col + #vim.fn.getline(".") - line_length })
      end
    end,
    pattern = "*",
    group = indent_group,
  })
end
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    local cmp_opts = {
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
      },
    };

    -- setup_autocmds()
    cmp.setup(cmp_opts)
  end,
}
