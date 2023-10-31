return {
  -- Git
  'tpope/vim-fugitive',

  -- GitHub plugin
  'tpope/vim-rhubarb',

  -- UNIX plugin
  'tpope/vim-eunuch',

  "sindrets/diffview.nvim",

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

  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    config = function()
      local keyset = vim.keymap.set

      keyset("n", "<leader>t", ":ToggleTerm size=160 direction=vertical<CR>", { silent = true })
      keyset("t", "<Esc>", [[<C-\><C-n>]])

      require('toggleterm').setup()
    end
  }
}
