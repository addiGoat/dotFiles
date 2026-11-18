-- Pause all keybinds
hl.bind("SUPER + SHIFT + P", hl.dsp.submap("pause"))
hl.define_submap("pause", function ()
   hl.bind("SUPER + SHIFT + P", hl.dsp.submap("reset"))
end)

-- 'resize'
hl.bind("SUPER + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Mouse Movement
hl.bind("SUPER + M", hl.dsp.submap("mouse"))

function move_mouse(direction)
    local mouse_pos = hl.get_cursor_pos()
    if not mouse_pos then
        return
    end

    if direction == "up" then
        mouse_pos.y = mouse_pos.y - 10
    elseif direction == "down" then
        mouse_pos.y = mouse_pos.y + 10
    elseif direction == "left" then
        mouse_pos.x = mouse_pos.x - 10
    elseif direction == "right" then
        mouse_pos.x = mouse_pos.x + 10
    end

    hl.dispatch(hl.dsp.cursor.move(mouse_pos))
end

hl.define_submap("mouse", function()
    hl.bind("h", function()
        move_mouse("left")
    end, { repeating = true })

    hl.bind("j", function()
        move_mouse("down")
    end, { repeating = true })

    hl.bind("k", function()
        move_mouse("up")
    end, { repeating = true })

    hl.bind("l", function()
        move_mouse("right")
    end, { repeating = true })

    hl.bind("Return", function()
        hl.dispatch(hl.dsp.send_shortcut({ mods = "", key = "mouse:272" }))
    end)

    hl.bind("escape", hl.dsp.submap("reset"))
end)
