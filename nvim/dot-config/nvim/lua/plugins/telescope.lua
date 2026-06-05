return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope file finder' })
        vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Telescope file finder' })
    end
}
