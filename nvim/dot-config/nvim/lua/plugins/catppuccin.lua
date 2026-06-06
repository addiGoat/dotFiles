return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavor = "macchiato",
        auto_integrations = true,
    },
    config = function(_, opts)
        vim.cmd.colorscheme "catppuccin"
    end
}
