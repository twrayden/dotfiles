-- Fuzzy Finder (files, lsp, etc)
local M = {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},

}

M.config = function()
	local keyset = vim.keymap.set

	local fuzzy_buffers = function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end

	keyset('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
	keyset('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
	keyset('n', '<leader>/', fuzzy_buffers, { desc = '[/] Fuzzily search in current buffer' })
	keyset('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
	keyset('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
	keyset('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
	keyset('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
	keyset('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
	keyset('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
	keyset('n', '<leader>fr', require('telescope.builtin').lsp_references,
		{ noremap = true, desc = '[F]ind [R]eferences' })

	-- Enable telescope fzf native, if installed
	pcall(require('telescope').load_extension, 'fzf')

	-- [[ Configure Telescope ]]
	-- See `:help telescope` and `:help telescope.setup()`
	require('telescope').setup({
		defaults = {
			path_display = { shorten = { len = 1, exclude = { -1, -2 } } },
			file_ignore_patterns = { "node_modules", "dist" },
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
		},
	})
end

return M
