-- Useful plugin to show you pending keybinds.
local M = {
    'folke/which-key.nvim',
    event = 'VeryLazy',
}

M.init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
end

M.config = function()
    local keyset = vim.keymap.set

    keyset({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

    require('which-key').setup({
        plugins = {
            spelling = { enabled = true, suggesions = 10 },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true
            }
        },
        operators = { gc = 'Comments' }
    })
end

return M
