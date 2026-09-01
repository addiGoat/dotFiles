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
        config = function()
            vim.keymap.set({ "n", "x" }, "<leader>ca", function()
                require("tiny-code-action").code_action()
            end, { noremap = true, silent = true })
        end,
    }
}
