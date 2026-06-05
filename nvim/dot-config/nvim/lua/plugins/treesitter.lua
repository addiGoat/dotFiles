return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = { "lua", "javascript", "cpp", "html", "css" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
    }
}
