--function M.setup_hyprbars()
--  if hl.plugin.hyprbars ~= nil then
--  hl.plugin.hyprbars.hyprbars_app({ app = "hyprbars"})

hl.config({
  plugin = {
    hyprbars = {
        bar_color = "rgba(42455cff)",

        ["col.text"] = "rgb(cfb4d1)",

	bar_height = 32,
	bar_padding = 14,
	bar_part_of_window = true,
	bar_precedence_over_border = true,

        bar_text_size = 16,
        bar_text_font = "JetBrainsMonoNerdFont",

	bar_buttons_alignment = "left",
	bar_button_padding = 10
    }
  }
})


hl.plugin.hyprbars.add_button({
	bg_color = "rgb(b54752)",
	fg_color = "rgb(b54752)",
	size = 16,
	icon = "",
	action = "hyprctl dispatch 'hl.dsp.window.close()'",
})

hl.plugin.hyprbars.add_button({
	bg_color = "rgb(c4a368)",
	fg_color = "rgb(c4a368)",
	size = 16,
	icon = "",
	action = "",
})

hl.plugin.hyprbars.add_button({
	bg_color = "rgb(6bc76b)",
	fg_color = "rgb(6bc76b)",
	size = 16,
	icon = "",
	action = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = \"maximized\", action = \"toggle\" })'",
})

hl.window_rule({
    name = "force-opaque-floating",
    match = { float = true },
    opacity = 1.0,
})

hl.window_rule({
	name = "disable-bar-on-tiled",
	match = { float = false },
	["hyprbars:no_bar"] = true,
})

hl.window_rule({
	name = "change-focused-bar-color",
	match = { focus = true },
	["hyprbars:bar_color"] = "rgba(9681dbff)",
})
