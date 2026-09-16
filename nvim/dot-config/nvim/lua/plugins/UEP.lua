return {
    {
        'taku25/UEP.nvim',
        dependencies = {
            { 'taku25/UNL.nvim', build = "cargo build --release --manifest-path scanner/Cargo.toml" }
        },

        opts = {
            -- UEP-specific settings
            uep = {
                -- Automatically start Neovim server (named pipe) on :UEP start
                server = {
                    enable = true,
                    name = "UEP_nvim", -- \\.\pipe\UEP_nvim on Windows
                },
                -- Command template for opening files in external IDEs
                ide = {
                    -- {file} and {line} will be replaced with actual values
                    open_command = "rider --line {line} \"{file}\"",
                },
            },


            -- Directory names to search for files during tree construction
            include_directory = { "Source", "Plugins", "Config", },

            -- Folder names to exclude during tree construction
            excludes_directory  = { "Intermediate", "Binaries", "Saved" },

            -- File extensions to be scanned by the ':UEP refresh' command
            files_extensions = {
                "cpp", "h", "hpp", "inl", "ini", "cs",
            },

            -- Manually specify the engine path if automatic detection fails.
            -- Example: "C:/Program Files/Epic Games/UE_5.4"
            engine_path = "/home/addigoat/UnrealEngine/5.8.2",

            -- UI backend settings (inherited from UNL.nvim)
            ui = {
                picker = {
                    mode = "auto", -- "auto", "telescope", "fzf_lua", "native"
                    prefer = { "telescope", "fzf_lua", "native" },
                },
                grep_picker = {
                    mode = "auto",
                    prefer = { "telescope", "fzf-lua" }
                },
                progress = {
                    enable = true,
                    mode = "auto", -- "auto", "fidget", "window", "notify"
                    prefer = { "fidget", "window", "notify" },
                },
            },
        },
    }
}
