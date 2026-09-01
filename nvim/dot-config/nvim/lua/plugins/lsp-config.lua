return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = {
                'clangd',
                'lua_ls',
                'pyright',
                'ts_ls',
            },
            automatic_enable = {
                'clangd',
                'lua_ls',
                'pyright',
                'ts_ls',
            },
        }
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = { 'mason-org/mason.nvim' },
        opts = {
            ensure_installed = {
                'stylua',
            }
        }
    }
}
