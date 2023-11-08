return {
    -- Move selected code blocks
    {
        'fedepujol/move.nvim',
        config = function()
            local keyset = vim.keymap.set

            local silentOpts = { noremap = true, silent = true }
            -- Normal-mode commands
            keyset('n', '<A-j>', ':MoveLine(1)<CR>', silentOpts)
            keyset('n', '<A-k>', ':MoveLine(-1)<CR>', silentOpts)
            keyset('n', '<A-h>', ':MoveHChar(-1)<CR>', silentOpts)
            keyset('n', '<A-l>', ':MoveHChar(1)<CR>', silentOpts)
            keyset('n', '<leader>wf', ':MoveWord(1)<CR>', silentOpts)
            keyset('n', '<leader>wb', ':MoveWord(-1)<CR>', silentOpts)

            -- Visual-mode commands
            keyset('v', '<A-j>', ':MoveBlock(1)<CR>', silentOpts)
            keyset('v', '<A-k>', ':MoveBlock(-1)<CR>', silentOpts)
            keyset('v', '<A-h>', ':MoveHBlock(-1)<CR>', silentOpts)
            keyset('v', '<A-l>', ':MoveHBlock(1)<CR>', silentOpts)


            -- Add keymaps for saving with control + s
            local opts = { noremap = true }
            keyset('n', '<c-s>', ':w<CR>', opts)
            keyset('i', '<c-s>', '<Esc>:w<CR>l', opts)
            keyset('v', '<c-s>', '<Esc>:w<CR>', opts)
        end
    },

    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },

    -- mappings to easily delete, change and add such surroundings in pairs
    'tpope/vim-surround',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- easily jump to places in code
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
        config = function()
            require('leap').add_default_mappings()
        end
    }
}
