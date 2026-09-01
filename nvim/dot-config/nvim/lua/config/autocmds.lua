-- Switch Relative/Absolute line numbers
local number_group = vim.api.nvim_create_augroup("NumberGroup", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = number_group,
  callback = function()
    vim.o.relativenumber = false
  end
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = number_group,
  callback = function()
    vim.o.relativenumber = true
  end
})
