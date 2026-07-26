-- Semantic Tags
--
hl.window_rule({
     match = { tag = "utility"},
     float = true,
     size = {1280, 720},
     opaque = true,
     ["hyprbars:no_bar"] = true
})

-- Specific Override Tags
--
hl.window_rule({
     match = { tag = "no_bar"},
     ["hyprbars:no_bar"] = true
})

hl.window_rule({
     match = { tag = "float"},
     float = true
})

hl.window_rule({
     match = { tag = "no_rounding"},
     rounding = 0
})

hl.window_rule({
     match = { tag = "opaque"},
     opaque = true
})
