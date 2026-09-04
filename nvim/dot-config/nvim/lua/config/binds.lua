local map = function(mode, key, cmd, desc)
    vim.keymap.set(mode, key, cmd, { desc = desc })
end


-- General operation commands

map('n', '<leader>w', '<cmd>w<CR>', "Save Current")
map('n', '<leader>a', '<cmd>wa<CR>', "Save All")
map('n', '<leader>x', '<cmd>wqa<CR>', "Save All & Quit")
map('n', '<leader>qq', '<cmd>q!<CR>', "Quit Without Saving")
map('n', '<leader>qa', '<cmd>qa!<CR>', "Quit all buffers Without Saving")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Q", "q", {})


-- Escape function switch
-- if search is highlighted, escape will unhighlight
-- if no search, escape enters insert mode
vim.keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
  else
    vim.cmd("startinsert")
  end
end, {silent = true})
