hl.window_rule({
    name = "float-main-steam-window",
    match = { class = "steam", title = "Steam" },
    tag = "-float",

    float = false
})

hl.window_rule({
    name = "pavucontrol-widget",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    opaque = true,
    border_color = "#5d78b0",
    monitor = "DP-1",
    move = {1675, 45},
    size = {865, 700},
    ["hyprbars:no_bar"] = true
})


-- hl.window_rule({
--     name = "fix-unreal",
--     match = {
--         class = "UnrealEditor",
--         float = false
--     },
--     workspace = 1,
--     opacity = 1,
--     rounding = 0,
-- })
--
hl.window_rule({
    name = "fix-unreal-floating-windows",
    match = {
        class = "UnrealEditor",
        float = true
    },

    decorate = false,
    ["hyprbars:no_bar"] = true,
    rounding = 0,
    size = {1280, 720},
    center = true
})
