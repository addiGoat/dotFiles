return {
    {
        'Mathijs-Bakker/godotdev.nvim',
        opts = {
            treesitter = {
                auto_setup = false,
            }
        },
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
            'nvim-treesitter/nvim-treesitter'
        },
    },
}
