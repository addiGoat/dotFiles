return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'saghen/blink.lib',
            'rafamadriz/friendly-snippets',
        },
        build = function()
            require('blink.cmp').build():wait(60000)
        end,

        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'none',
                ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-n>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-CR>'] = { 'select_and_accept' },
                ['<C-e>'] = { 'hide' },
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 300,
                },
                ghost_text = {
                    enabled = true,
                },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets' },
                per_filetype = {
                    markdown = { 'path', 'snippets', 'buffer' },
                    text = { 'buffer' },
                },
            },

            fuzzy = {
                implementation = 'prefer_rust_with_warning',
                sorts = {
                    'exact',
                    'score',
                    'sort_text',
                },
            },

            signature = {
                enabled = true,
            },
        },
    }
}
