return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Search file names' })
            vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Search project file contents' })
            vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = 'Search help tags' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
