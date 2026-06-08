return {
    "barrettruth/live-server.nvim",
    config = function ()
        vim.keymap.set('n', '<leader>lss', function()
            vim.cmd("LiveServerStart")
        end)

        vim.keymap.set('n', '<leader>lsx', function()
            vim.cmd("LiveServerStop")
        end)
    end
}
