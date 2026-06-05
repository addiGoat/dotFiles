vim.diagnostic.config({
    virtual_text = true
})

vim.api.nvim_create_autocmd('LspAttach', {
callback = function(args)
    local bufnr = args.buf
    local map = function(mode, bind, cmd, desc)
        vim.keymap.set(mode, bind, cmd, { buffer = bufnr, desc = desc } )
    end
    map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
end
})
--        config = function()
--            vim.diagnostic.config({
--                virtual_text = true
--            })
--            vim.lsp.enable('lua_ls')
--
--            vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {})
--            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
--        end
