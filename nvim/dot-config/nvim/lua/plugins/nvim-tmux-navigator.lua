return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,

        config = function()
            if vim.env.TMUX == nil or vim.env.TMUX == "" then
                local terminal_mappings = {
                    ["<C-h>"] = "TmuxNavigateLeft",
                    ["<C-j>"] = "TmuxNavigateDown",
                    ["<C-k>"] = "TmuxNavigateUp",
                    ["<C-l>"] = "TmuxNavigateRight",
                }

                for key, command in pairs(terminal_mappings) do
                    vim.keymap.set( "t", key, function()
                        vim.cmd(command)
                    end, {
                        silent = true,
                        desc = command,
                    })
                end
            end
        end,
    },
}
