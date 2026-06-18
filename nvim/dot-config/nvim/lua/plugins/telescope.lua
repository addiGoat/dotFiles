return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require('telescope').setup {
                pickers = {
                    find_files = {
                        theme = "ivy"
                    }
                }
            }
            -- local bind_builtin = function(picker)
            -- end
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Search file names' })
            vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Search project file contents' })
            vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = 'Search help docs' })
            vim.keymap.set('n', '<Leader>fc', function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
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
