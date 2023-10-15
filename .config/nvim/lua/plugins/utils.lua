return {
  -- Git
  'tpope/vim-fugitive',

  -- GitHub plugin
  'tpope/vim-rhubarb',

  -- UNIX plugin
  'tpope/vim-eunuch',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Traditional directory style view mode from IDEs
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require('nvim-tree').setup()
    end,
  },
}
