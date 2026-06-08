local map = function(mode, key, cmd, desc)
    vim.keymap.set(mode, key, cmd, { desc = desc })
end


map('n', '<leader>w', '<cmd>w<CR>', "Save File")
map('n', '<leader>a', '<cmd>wa<CR>', "Save All")
map('n', '<leader>x', '<cmd>wqa<CR>', "Save All & Quit")
