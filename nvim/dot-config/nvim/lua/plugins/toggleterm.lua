return{
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        lazy = false,
        
        opts = {
            direction = "horizontal",
            size = 15,
            start_in_insert = true,
            insert_mappings = false,
            terminal_mappings = false,
            close_on_exit = true,

            on_open = function()
                vim.cmd("startinsert!")
            end
        },

        keys = {
            {
                "<C-t>",
                '<cmd>ToggleTerm<CR>',
                mode = { "n" },
                desc = "Toggle terminal",
            },
            -- {
            --     "<leader>tf",
            --     "<cmd>2ToggleTerm direction=float<CR>",
            --     mode = { "n" },
            --     desc = "Toggle floating terminal",
            -- },
        },

        config = function(_, opts)
            require("toggleterm").setup(opts)

            require("terminal.apps").setup()

            local terminal_options = { buffer = 0, silent = true }

            vim.api.nvim_create_autocmd("TermOpen", {
                callback = function()
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                    vim.opt_local.signcolumn = "no"
                    
                    -- Global terminal mode escape hatch
                    vim.keymap.set(
                        "t",
                        "<C-t>",
                        [[<C-\><C-n><cmd>ToggleTerm<CR>]],
                        terminal_options
                    )
                    
                end
            })
        end
    },
}

