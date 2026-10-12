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

