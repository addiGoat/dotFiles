source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
    if not set -q NO_FETCH
        hyfetch
    end
end

starship init fish | source
zoxide init fish | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

fish_add_path /home/addigoat/.spicetify
fish_add_path /home/addigoat/.scripts
