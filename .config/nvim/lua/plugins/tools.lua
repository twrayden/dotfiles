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

      local keyset = vim.keymap.set

      keyset("n", "<leader>e", ":NvimTreeOpen<CR>", { silent = true })

      require('nvim-tree').setup({
        view = { adaptive_size = true }
      })
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    config = function()
      local keyset = vim.keymap.set

      keyset("n", "<leader>t", ":ToggleTerm size=60 direction=vertical<CR>", { silent = true })
      keyset("t", "<C-w>", [[<C-\><C-n>]])

      require('toggleterm').setup()
    end
  }
}
