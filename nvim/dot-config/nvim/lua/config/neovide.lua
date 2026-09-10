vim.o.guifont = "JetBrainsMono Nerd Font"

vim.api.nvim_create_autocmd("VimEnter", {
   callback = function()
       vim.cmd("Neotree focus")
   end,
})
