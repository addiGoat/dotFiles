return {
    "mbwilding/UnrealEngine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>ug",
            function()
                require("unrealengine.commands").generate_lsp()
            end,
            desc = "UnrealEngine: Generate LSP"
        },
        {
            "<leader>ub",
            function()
                require("unrealengine.commands").build()
            end,
            desc = "UnrealEngine: Build"
        },
        {
            "<leader>ur",
            function()
                require("unrealengine.commands").rebuild()
            end,
            desc = "UnrealEngine: Rebuild"
        },
        {
            "<leader>uo",
            function()
                require("unrealengine.commands").open()
            end,
            desc = "UnrealEngine: Open Editor"
        },
        {
            "<leader>uc",
            function()
                require("unrealengine.commands").clean()
            end,
            desc = "UnrealEngine: Clean"
        },
        {
            "<leader>up",
            function()
                require("unrealengine.commands").build_plugin()
            end,
            desc = "UnrealEngine: Build Plugin"
        },
        -- This CANNOT be used, it installs the plugin into the source build directory
        -- but i'm running a binary install, so it fucks the whole damn plugin up
        -- {
        --     "<leader>ue",
        --     function()
        --         require("unrealengine.commands").build_engine()
        --     end,
        --     desc = "UnrealEngine: Link Plugin - Build Engine"
        -- },
    },
    -- Optional, this will update and build the Unreal Engine plugin on update
    build = function()
        -- Path required to be passed in
        require("unrealengine.commands").build_engine({ engine_path = "/home/addigoat/UnrealEngine/5.8.2" })
    end,
    opts = {
        auto_generate = true, -- Auto generates LSP info when detected in CWD | default: false
        auto_build = true, -- Auto builds on save | default: false
        engine_path = "/home/addigoat/UnrealEngine/5.8.2", -- Path to your UnrealEngine source directory
        build_type = "Development", -- Build type: "DebugGame", "Development", or "Shipping"
        with_editor = true, -- Build with editor | default: true
        register_icon = true, -- Register Unreal Engine icon for .uproject files | default: true
        register_filetypes = true, -- Register .uproject and .uplugin as JSON | default: true
        close_on_success = true, -- Close terminal split on successful builds | default: true
        environment_variables = nil, -- Environment variables to pass when launching editor (Linux/Mac only)
    }
}
