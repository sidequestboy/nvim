-- General keymaps (keep plugin-specific ones in plugins/)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- buffer maps
vim.keymap.set({ 'n' }, '<tab>', function() vim.cmd('bn') end, { desc = 'next buffer' })
vim.keymap.set({ 'n' }, '<S-tab>', function() vim.cmd('bp') end, { desc = 'previous buffer' })
vim.keymap.set({ 'n' }, '<leader>x', function() vim.cmd('bd') end, { desc = '[X] delete buffer' })
