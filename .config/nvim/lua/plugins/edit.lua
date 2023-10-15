return {
    -- Move selected code blocks
    {
        'fedepujol/move.nvim',
        config = function()
            local keyset = vim.keymap.set

            local opts = { noremap = true, silent = true }
            -- Normal-mode commands
            keyset('n', '<A-j>', ':MoveLine(1)<CR>', opts)
            keyset('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
            keyset('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
            keyset('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
            keyset('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
            keyset('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

            -- Visual-mode commands
            keyset('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
            keyset('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
            keyset('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
            keyset('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
        end
    },

    -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
}
