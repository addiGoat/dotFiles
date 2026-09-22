return {
    "L3MON4D3/LuaSnip",

    config = function()
        local ls = require("luasnip")

        require("luasnip.loaders.from_lua").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
        })

        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                return "<Tab>"
            end
        end, { expr = true })

        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            else
                return "<S-Tab>"
            end
        end, { expr = true })
    end,
}
