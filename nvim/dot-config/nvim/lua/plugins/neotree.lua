return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,
    keys = {
        { '\\', ':Neotree filesystem toggle left<CR>', desc = 'NeoTree Toggle', silent = true },
    },
    opts = {
        close_if_last_window = true,
        commands = {
            open_and_close = function(state)
                local node = state.tree:get_node()
                state.commands.open(state)

                if node.type == "file" then
                    vim.cmd("Neotree close")
                end
            end,
        },
        window = {
            mappings = {
                ["<space>"] = {
                    "toggle_preview",
                    config = {
                        use_float = false
                    },
                },
                ["<cr>"] = "open_and_close"
            },
        }
    }
}

