local languages = {
    "cpp",
    "css",
    "c_sharp",
    "gdscript",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
}

local filetypes = {
    "cpp",
    "cs",
    "css",
    "gdscript",
    "html",
    "javascript",
    "lua",
    "markdown",
    "python",
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
    },
}
