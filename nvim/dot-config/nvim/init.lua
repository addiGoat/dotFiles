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

-- Tmux run window
local function tmux_run(cmd)
    vim.cmd("write")

    local pane = vim.g.tmux_runner_pane

    -- Check whether the stored pane still exists
    if pane and pane ~= "" then
        local ok = vim.fn.system("tmux list-panes -F '#{pane_id}' | grep -Fx " .. pane)
        if vim.v.shell_error ~= 0 then
            pane = nil
            vim.g.tmux_runner_pane = nil
        end
    end

    -- Create a new pane if needed
    if not pane then
        pane = vim.trim(vim.fn.system(
            "tmux split-window -v -p 30 -P -F '#{pane_id}'"
        ))
        vim.g.tmux_runner_pane = pane
    end

    vim.fn.system("tmux send-keys -t " .. pane .. " C-c")
    vim.fn.system("tmux send-keys -t " .. pane .. " clear C-m")
    vim.fn.system("tmux send-keys -t " .. pane .. " " .. vim.fn.shellescape(cmd) .. " C-m")
end

vim.keymap.set("n", "<leader>r", function()
  tmux_run("make run")
end, { desc = "Run project in tmux pane" })

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
