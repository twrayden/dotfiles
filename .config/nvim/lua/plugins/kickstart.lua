return {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- UNIX plugins
  'tpope/vim-eunuch',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

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

  -- Find usages of symbols
  'pechorin/any-jump.vim',

  -- "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',

  {
    -- Traditional directory style view mode from IDEs
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
    -- Find and replace
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    -- Fuzzy finder
    'junegunn/fzf.vim',
    dependencies = {
      'junegunn/fzf',
    }
  },

  {
    -- Check git log of selected code
    'niuiic/git-log.nvim',
    dependencies = {
      'niuiic/core.nvim'
    }
  }
}
