hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_rules   = "",

        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        repeat_rate = 45,
        repeat_delay = 200,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "ergo-m575s-mouse",
    sensitivity = -0.55,
})

hl.device({
    name        = "logitech-g502-x-ls-1",
    sensitivity = -0.55,
})
