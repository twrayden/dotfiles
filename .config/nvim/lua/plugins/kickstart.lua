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
  'fedepujol/move.nvim',

  -- Find usages of symbols
  'pechorin/any-jump.vim',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',     opts = {} },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',      opts = {} },

  { 'xiyaowong/transparent.nvim' },

  { 'sainnhe/everforest',        lazy = false },

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
