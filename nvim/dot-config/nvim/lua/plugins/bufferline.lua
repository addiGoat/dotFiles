return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",

        keys = {
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
            { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
            { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to close" },
            { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
        },

        opts = {
            options = {
                mode = "buffers",
                diagnostics = "nvim_lsp",
                separator_style = "slope",
                always_show_bufferline = false,
                show_buffer_close_icons = true,
                show_close_icon = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Explorer",
                        separator = true,
                    },
                },
            },
        },
    }
}
