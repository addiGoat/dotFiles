vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.number = true
vim.o.relativenumber = true

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


vim.g.mapleader = " "

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate'
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,
        keys = {
            { '\\', ':Neotree filesystem toggle left<CR>', desc = 'NeoTree Toggle', silent = true },
        }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    }
}


local opts = {}

-- Setup Lazy
require("lazy").setup(plugins, opts)

-- Telescope Keybinds
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope file finder' })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Telescope file finder' })

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "javascript", "cpp", "html", "css" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true }
})

-- Neo-Tree Setup
require('neo-tree').setup({
    close_if_last_window = true,
    commands = {
        open_and_close = function(state)
            local node = state.tree:get_node()
            state.commands.open(state)

            if node.type == "file" then
                vim.cmd("Neotree close")
            end
        end,
    },
    window = {
        mappings = {
            ["<space>"] = {
                "toggle_preview",
                config = {
                    use_float = false
                },
            },
            ["<cr>"] = "open_and_close"
        },
    }
})

