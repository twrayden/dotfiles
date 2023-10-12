local M = {
    'mrjones2014/legendary.nvim',
    version = 'v2.1.0',
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
}

M.config = function()
    local opts = { noremap = true }
    require('legendary').setup({
        keymaps = {
            {
                '<leader>?',
                require('telescope.builtin').oldfiles,
                description = '[?] Find recently opened files'
            },
            {
                '<leader><space>',
                require('telescope.builtin').buffers,
                description = '[ ] Find existing buffers'
            },
            {
                '<leader>/',
                function()
                    -- You can pass additional configuration to telescope to change theme, layout, etc.
                    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end,
                description = '[/] Fuzzily search in current buffer'
            },
            {
                '<leader>gf',
                require('telescope.builtin').git_files,
                description = 'Search [G]it [F]iles'
            },
            { '<leader>sf', require('telescope.builtin').find_files,     description = '[S]earch [F]iles' },
            { '<leader>sh', require('telescope.builtin').help_tags,      description = '[S]earch [H]elp' },
            { '<leader>sw', require('telescope.builtin').grep_string,    description = '[S]earch current [W]ord' },
            { '<leader>sg', require('telescope.builtin').live_grep,      description = '[S]earch by [G]rep' },
            { '<leader>sd', require('telescope.builtin').diagnostics,    description = '[S]earch [D]iagnostics' },
            { '<leader>fr', require('telescope.builtin').lsp_references, description = '[F]ind [R]eferences',    opts },
            {
                '<leader>gp',
                require('gitsigns').prev_hunk,
                description =
                '[G]o to [P]revious Hunk'
            },
            {
                '<leader>gn',
                require('gitsigns').next_hunk,
                description = '[G]o to [N]ext Hunk'
            },
            {
                '<leader>ph',
                require('gitsigns').preview_hunk,
                description = '[P]review [H]unk'
            },
            {
                '<A-j>',
                { n = ':MoveLine(1)<CR>', v = ':MoveBlock(1)<CR>' },
                description = 'Line/block: move down',
                opts
            },
            {
                '<A-k>',
                { n = ':MoveLine(-1)<CR>', v = ':MoveBlock(-1)<CR>' },
                description = 'Line/block: move up',
                opts
            },
            {
                '<A-h>',
                { n = ':MoveHChar(-1)<CR>', v = ':MoveHBlock(-1)<CR>' },
                description = 'Line/block: move left',
                opts
            },
            {
                '<A-l>',
                { n = ':MoveHChar(1)<CR>', v = ':MoveHBlock(1)<CR>' },
                description = 'Line/block: move right',
                opts
            },
            { '<Space>', '<Nop>', opts = { silent = true } }
        },
        autocmds = {
            {
                name = 'YankHighlight',
                clear = true,
                {
                    'TextYankPost',
                    vim.highlight.on_yank,
                }
            }
        },
        extensions = {
            nvim_tree = true,
            lazy_nvim = true,
            which_key = {
                -- Automatically add which-key tables to legendary
                -- see WHICH_KEY.md for more details
                auto_register = false,
                -- you can put which-key.nvim tables here,
                -- or alternatively have them auto-register,
                -- see WHICH_KEY.md
                mappings = {},
                opts = {},
                -- controls whether legendary.nvim actually binds they keymaps,
                -- or if you want to let which-key.nvim handle the bindings.
                -- if not passed, true by default
                do_binding = true,
                -- controls whether to use legendary.nvim item groups
                -- matching your which-key.nvim groups; if false, all keymaps
                -- are added at toplevel instead of in a group.
                use_groups = true,
            }
        }
    })
end

return M
