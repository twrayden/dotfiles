return {
    'xiyaowong/transparent.nvim',

    'sainnhe/everforest',

    {
        'dracula/vim',
        init = function()
            vim.cmd.colorscheme('dracula')
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

    {
        'anuvyklack/windows.nvim',
        dependencies = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim'
        },
        init = function()
            vim.o.winwidth = 5
            vim.o.winminwidth = 5
            vim.o.equalalways = false
        end
    },

    -- Set lualine as statusline
    {
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'dracula',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {
                    { 'mode', fmt = function(str) return str:sub(1, 1) end } },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'filename', 'location' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        },
    },

    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            signcolumn = true,
            current_line_blame = true
        },
    },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('alpha').setup(require('alpha.themes.startify').config)
        end
    }
}
