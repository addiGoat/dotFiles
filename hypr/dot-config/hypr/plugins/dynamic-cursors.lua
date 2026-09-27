if hl.plugin.dynamic_cursors then
    hl.config { plugin = { dynamic_cursors = {
        enabled = true,
        mode = "stretch",
        threshold = 2,

        rotate = {
            length = 20,
            offset = 0.0,
        },

        tilt = {
            limit = 5000,
            activation = "negative_quadratic",
            window = 100,
            full = 60,
        },

        stretch = {

            -- controls how much the cursor is stretched
            -- this value controls at which speed (px/s) the full stretch is reached
            -- the full stretch being twice the original length
            limit = 3000,

            -- relationship between speed and stretch amount, supports these values:
            -- linear             - a linear function is used
            -- quadratic          - a quadratic function is used
            -- negative_quadratic - negative version of the quadratic one, feels more aggressive
            -- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
            activation = "quadratic",

            -- time window (ms) over which the speed is calculated
            -- higher values will make slow motions smoother but more delayed
            window = 100,
        },

        -- configure shake to find
        -- magnifies the cursor if its is being shaken
        shake = {
            enabled = true,

            -- controls how soon a shake is detected
            threshold = 7.0,

            -- magnification level immediately after shake start
            base = 4.0,
            -- magnification increase per second when continuing to shake
            speed = 4.0,
            -- how much the speed is influenced by the current shake intensity
            influence = 0.0,

            -- maximal magnification the cursor can reach
            -- values below 1 disable the limit (e.g. 0)
            limit = 0.0,

            -- time in milliseconds the cursor will stay magnified after a shake has ended
            timeout = 2000,

            -- show cursor behaviour `tilt`, `rotate`, etc. while shaking
            effects = true,

            -- enable ipc events for shake
            -- see the `ipc` section below
            ipc = false,
        },

        -- use hyprcursor to get a higher resolution texture when the cursor is magnified
        -- see the `hyprcursor` section below
        hyprcursor = {

            -- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
            -- this will also have effect without hyprcursor support being enabled
            -- 0 - never use pixelated scaling
            -- 1 - use pixelated when no highres image
            -- 2 - always use pixelated scaling
            nearest = 1,

            -- enable dedicated hyprcursor support
            enabled = true,

            -- resolution in pixels to load the magnified shapes at
            -- be warned that loading a very high-resolution image will take a long time and might impact memory consumption
            -- -1 means we use [normal cursor size] * [shake:base option]
            resolution = -1,

            -- shape to use when clientside cursors are being magnified
            -- see the shape-name property of shape rules for possible names
            -- specifying clientside will use the actual shape, but will be pixelated
            fallback = "clientside",
        },
    }}}
end
