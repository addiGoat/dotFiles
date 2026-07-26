local function apply_profile(profile)
    for _, tag in ipairs(profile.tags) do
        hl.window_rule({
            match = profile.match,
            tag = "+" .. tag,
        })
    end
end

local window_profiles = {
    {
        match = { title = "kitty-float" },
        tags = { "utility", "no_rounding" }
    },
    {
        match = { class = "^(steam)$" },
        tags = { "float" }
    },
    {
        match = { title = "Stats", class = "com.obsproject.Studio" },
        tags = { "float" }
    },
    {
        match = { class = "Godot" },
        tags = { "no_rounding", "no_bar" }
    },
    {
        match = { class = "mpv" },
        tags = { "utility", "no_rounding" }
    },
    {
        match = { title = ".* - YouTube.*" },
        tags = { "opaque" }
    },
    {
        match = { title = "YARG" },
        tags = { "opaque", "float" }
    },
}

for _, profile in ipairs(window_profiles) do
    apply_profile(profile)
end

return window_profiles
