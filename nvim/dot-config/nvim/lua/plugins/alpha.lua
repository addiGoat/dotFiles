return {
    {
        'goolord/alpha-nvim',
        config = function ()
            local dashboard = require('alpha.themes.dashboard')

            dashboard.section.buttons.val = {
                dashboard.button("e", " New File", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", " Find File", ":Telescope find_files <CR>"),
                dashboard.button("c", " Search Configs", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config")
                }
                end)
            }
            require'alpha'.setup(dashboard.config)
        end
    };
}
