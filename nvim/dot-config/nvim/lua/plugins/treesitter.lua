local languages = {
    "lua",
    "python",
    "javascript",
    "cpp",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "gdscript",
}

local filetypes = {
    "lua",
    "python",
    "javascript",
    "cpp",
    "html",
    "css",
    "markdown",
    "gdscript",
}
return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',


        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install(languages)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = filetypes,
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
        -- opts = {
        --     ensure_installed = { "lua", "python", "javascript", "cpp", "html", "css", "markdown" },
        --     auto_install = true,
        --     highlight = { enable = true },
        --     indent = { enable = true }
        -- }
    },
}
