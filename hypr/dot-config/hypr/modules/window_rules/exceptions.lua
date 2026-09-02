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
