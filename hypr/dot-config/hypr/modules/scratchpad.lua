hl.bind("ALT + GRAVE", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind("ALT + SHIFT + GRAVE", function()
    local window = hl.get_active_window()
    if window ~= nil and window.floating == false then
        hl.dispatch(hl.dsp.window.float({ action = "set"}))
    end
    hl.dispatch(hl.dsp.window.move({ workspace = "special:scratchpad", window = window}))
end)
