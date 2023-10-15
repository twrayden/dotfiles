return {
    {
        'sainnhe/everforest',
        lazy = false,
        init = function()
            vim.cmd.colorscheme('everforest')
        end,
        config = function()
            vim.api.nvim_create_autocmd('TextYankPost', {
                callback = function()
                    vim.highlight.on_yank()
                end,
                pattern = '*',
                desc = 'Highlight on yank'
            })
        end
    },

    'xiyaowong/transparent.nvim',

    {
        'anuvyklack/windows.nvim',
        dependencies = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim'
        },
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'everforest',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

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
            }
        },
    },
}
