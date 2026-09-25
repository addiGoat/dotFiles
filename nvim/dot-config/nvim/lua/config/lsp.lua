vim.diagnostic.config({
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
    },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
        },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
callback = function(args)
    local bufnr = args.buf
    local map = function(mode, bind, cmd, desc)
        vim.keymap.set(mode, bind, cmd, { buffer = bufnr, desc = desc } )
    end
    map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
    map('n', '<leader>gd', vim.lsp.buf.definition, 'Goto Definition')
end
})
