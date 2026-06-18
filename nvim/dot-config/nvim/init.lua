require("config.opts")
require("config.lsp")
require("config.binds")

-- Sync clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

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

-- Install Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy
require("lazy").setup("plugins")
