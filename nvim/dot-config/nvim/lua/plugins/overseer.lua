return {
    {
        'stevearc/overseer.nvim',
        ---@module 'overseer'
        ---@type overseer.SetupOpts
        opts = {
            task_list = {
                max_height = {20, 0.2},
                min_height = {20, 0.2}
            }
        },

        config = function ()
            vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<CR>', { desc = "Open the overseer runner menu" } )
            vim.keymap.set('n', '<leader>ot', '<cmd>OverseerToggle<CR>', { desc = "Open the overseer task output list" })
        end

    }
}
