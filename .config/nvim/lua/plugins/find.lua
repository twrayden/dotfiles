return {
    -- Find usages of symbols
    'pechorin/any-jump.vim',

    -- Find and replace
    {
        'nvim-pack/nvim-spectre',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    -- Fuzzy finder
    {
        'junegunn/fzf.vim',
        dependencies = {
            'junegunn/fzf',
        }
    },
}
