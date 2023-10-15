-- Highlight, edit, and navigate code
local M = {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ':TSUpdate',
}

M.config = function()
	-- [[ Configure Treesitter ]]
	-- See `:help nvim-treesitter`
	require('nvim-treesitter.configs').setup({
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = {
			'c', 'cpp', 'go', 'lua', 'luadoc', 'python', 'rust', 'tsx', 'typescript', 'javascript', 'vimdoc',
			'vim', 'json', 'html', 'gitignore', 'gitcommit', 'csv', 'http', 'regex', 'scss', 'toml', 'yaml',
			'xml'
		},
		modules = {},
		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		auto_install = false,
		ignore_install = {},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	})
end

return M
