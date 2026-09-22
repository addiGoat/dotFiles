local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
    s("class", fmt([[
        class {} {{
        public:
            {}();

        private:
            {}
        }};
    ]], {
        i(1, "ClassName"),
        rep(1),
        i(0),
    })),
}
