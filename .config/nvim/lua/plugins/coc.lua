local M = {
    "neoclide/coc.nvim",
    branch = "release",
}

M.config = function()
    -- Autocomplete
    function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    -- Use K to show documentation in preview window
    function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
        else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
    end

    -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
    })


    -- Setup formatexpr specified filetype(s)
    vim.api.nvim_create_autocmd("FileType", {
        group = "CocGroup",
        pattern = "typescript,json",
        command = "setl formatexpr=CocAction('formatSelected')",
        desc = "Setup formatexpr specified filetype(s)."
    })

    -- Update signature help on jump placeholder
    vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        desc = "Update signature help on jump placeholder"
    })

    -- Add `:Format` command to format current buffer
    vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

    -- Add `:OR` command for organize imports of the current buffer
    vim.api.nvim_create_user_command("FormatImports", "call CocActionAsync('runCommand', 'editor.action.organizeImport')",
        {})

    -- Add (Neo)Vim's native statusline support
    -- NOTE: Please see `:h coc-status` for integrations with external plugins that
    -- provide custom statusline: lightline.vim, vim-airline
    vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

    local keyset = vim.keymap.set

    local exprOpts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    local actionOpts = { silent = true, nowait = true }
    local silentOpts = { silent = true }

    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        exprOpts)
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], exprOpts)

    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], exprOpts)

    -- Apply codeAction to the selected region
    -- Example: `<leader>aap` for current paragraph
    keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", actionOpts)
    keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", actionOpts)

    -- Remap keys for apply code actions at the cursor position.
    keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", actionOpts)
    -- Remap keys for apply code actions affect whole buffer.
    keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", actionOpts)
    -- Remap keys for applying codeActions to the current buffer
    keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", actionOpts)
    -- Apply the most preferred quickfix action on the current line.
    keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", actionOpts)
    -- Run the Code Lens actions on the current line
    keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", actionOpts)

    -- Remap keys for apply refactor code actions.
    keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", silentOpts)
    keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", silentOpts)
    keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", silentOpts)

    -- GoTo code navigation
    keyset("n", "gd", "<Plug>(coc-definition)", silentOpts)
    keyset("n", "gy", "<Plug>(coc-type-definition)", silentOpts)
    keyset("n", "gi", "<Plug>(coc-implementation)", silentOpts)
    keyset("n", "gr", "<Plug>(coc-references)", silentOpts)

    -- Symbol renaming
    keyset("n", "<leader>rn", "<Plug>(coc-rename)", silentOpts)
end

return M
