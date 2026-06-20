local map = function(mode, key, cmd, desc)
    vim.keymap.set(mode, key, cmd, { desc = desc })
end


map('n', '<leader>w', '<cmd>w<CR>', "Save File")
map('n', '<leader>a', '<cmd>wa<CR>', "Save All")
map('n', '<leader>x', '<cmd>wqa<CR>', "Save All & Quit")
map('n', '<leader>qq', '<cmd>q!<CR>', "Quit Without Saving")
map('n', '<leader>qa', '<cmd>qa!<CR>', "Quit all buffers Without Saving")

map('n', '<c-h>', ':wincmd h<CR>', "wincmd left")
map('n', '<c-j>', ':wincmd j<CR>', "wincmd down")
map('n', '<c-k>', ':wincmd k<CR>', "wincmd up")
map('n', '<c-l>', ':wincmd l<CR>', "wincmd right")
