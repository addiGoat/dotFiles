local map = function(mode, key, cmd, desc)
    vim.keymap.set(mode, key, cmd, { desc = desc })
end

vim.keymap.set('n', '<leader>lss', function()
    vim.cmd("LiveServerStart")
end)

vim.keymap.set('n', '<leader>lsx', function()
    vim.cmd("LiveServerStop")
end)

map('n', '<leader>w', '<cmd>w<CR>', "Save File")
map('n', '<leader>a', '<cmd>wa<CR>', "Save All")
map('n', '<leader>x', '<cmd>wqa<CR>', "Save All & Quit")
