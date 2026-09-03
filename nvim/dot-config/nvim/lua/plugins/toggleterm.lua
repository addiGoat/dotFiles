return{
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        
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
                "<cmd>ToggleTerm<CR>",
                mode = { "t", "n" },
                desc = "Toggle terminal",
            }
        },

        config = function(_, opts)
            require("toggleterm").setup(opts)

            local terminal_options = { buffer = 0, silent = true }

            vim.api.nvim_create_autocmd("TermOpen", {
                callback = function()
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                    vim.opt_local.signcolumn = "no"

                    vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], terminal_options)
                end
            })
        end
    },
}

