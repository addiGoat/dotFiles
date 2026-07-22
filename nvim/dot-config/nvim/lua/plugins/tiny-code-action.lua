return {
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            {"nvim-telescope/telescope.nvim"},
            {
                "folke/snacks.nvim",
                opts = {
                    terminal = {},
                }
            }
        },
        event = "LspAttach",
        opts = {},
    }
}
