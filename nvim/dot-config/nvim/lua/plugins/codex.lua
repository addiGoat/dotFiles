return {
    {
        "leejh903/codex.nvim",
        dependencies = { "folke/snacks.nvim" },
        lazy = false,
        config = function()
            require("codex").setup()
            require("codex").start()
            require("codex.terminal").setup({
                split_side = "right",
                split_width_percentage = 0.30,
            })
        end,
        keys = {},
    }
}
