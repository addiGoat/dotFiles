
local Terminal = require("toggleterm.terminal").Terminal

local M = {}

local apps = {
    {
        name = "LazyGit",
        cmd = "lazygit",
        key = "<leader>tg",
        dir = "git_dir"
    },
    {
        name = "Floating Shell",
        key = "<leader>tf",
    },
    {
        name = "Cherri Docker",
        cmd = "ssh cherri -t lazydocker",
        key = "<leader>td"
    },
    {
        name = "Superfile Browser",
        cmd = "spf",
        key = "<leader>tb"
    },
}

function M.setup()
    for _, app in ipairs(apps) do
        local terminal

        terminal = Terminal:new({
            cmd = app.cmd,
            dir = app.dir,
            direction = "float",
            hidden = true,

            on_open = function(term)
                vim.keymap.set("t", "<C-t>", function()
                    term:toggle()
                end, {
                    buffer = term.bufnr,
                    silent = true,
                })
            end,
        })

        vim.keymap.set("n", app.key, function()
            terminal:toggle()
        end, {
            desc = "Toggle " .. app.name,
        })
    end
end


return M
