-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move lines
vim.keymap.set('n', 'A-k', '^[k', { silent = true })
vim.keymap.set('n', 'A-j', '^[j', { silent = true })

