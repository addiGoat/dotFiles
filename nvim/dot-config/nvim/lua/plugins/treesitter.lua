return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = { "lua", "javascript", "cpp", "html", "css", "markdown" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }
        }
    }
}
