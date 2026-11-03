return {
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",

            -- For a custom log pager
            "m00qek/baleia.nvim",

        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    },
}
