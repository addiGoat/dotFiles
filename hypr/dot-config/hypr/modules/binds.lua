-- Main bindings (terminal, browser, launcher etc.)
hl.bind(MainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + Q", hl.dsp.window.close())
hl.bind(MainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("gtk-launch $(xdg-settings get default-web-browser)"))
hl.bind(MainMod .. " + D", hl.dsp.exec_cmd(Launcher))

-- Rofi emoji
hl.bind("SUPER + E", hl.dsp.exec_cmd("rofi -show emoji"))



-- =====================================
-- ==== Window/Workspace Management ====
-- =====================================

-- Workspace Switching
for i = 1, 5 do
	-- Alt+[1-5] for main monitor
	hl.bind(MainMod .. " + " .. i , hl.dsp.focus({ workspace = i }))
	hl.bind(MainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))

	-- Super+[1-5] for second monitor
	hl.bind("SUPER + " .. i , hl.dsp.focus({ workspace = i + 5}))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i + 5 }))
end

-- Window Movement
hl.bind(MainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(MainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + l", hl.dsp.focus({ direction = "right" }))

hl.bind(MainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(MainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(MainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(MainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode="fullscreen", action="toggle" }))
hl.bind("SUPER + T", hl.dsp.window.float({ action="toggle"}))

-- Move/Resize windows
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())


-- =========================
-- ==== Multimedia Keys ====
-- =========================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),
    { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),
    { locked = true })



-- =======================
-- ==== Miscellaneous ====
-- =======================

-- Screen Capture
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --freeze --clipboard-only")) -- Screenshot
hl.bind(MainMod .. " + Print", hl.dsp.exec_cmd("pkill -SIGUSR1 -f '^gpu-screen-recorder'")) -- Shadowplay

-- Toggleable term
hl.bind("CONTROL + SHIFT + K", hl.dsp.exec_cmd("kitten quick-access-terminal"))


-- Clipboard History
hl.bind("SUPER + V", hl.dsp.exec_cmd("clippy"))

