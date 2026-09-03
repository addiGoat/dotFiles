return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,

        opts = {
            animate = {
                enabled = true
            },

            scroll = {
                enabled = true,

                animate = {
                    duration = { step = 10, total = 120 },
                    easing = "linear",
                },

                animate_repeat = {
                    delay = 100,
                    duration = { step = 5, total = 40 },
                    easing = "linear",
                },
            },
        },
    }
}
