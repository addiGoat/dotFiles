source ~/.config/fish/cachyos-config.fish

function fish_greeting
    if not set -q NO_FETCH
        hyfetch
    end
end

starship init fish | source
zoxide init fish --cmd cd | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

export "EDITOR=nvim"

fish_add_path /home/addigoat/.spicetify
fish_add_path /home/addigoat/.scripts
fish_add_path /home/addigoat/.cargo/bin
