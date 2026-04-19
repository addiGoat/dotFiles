source /usr/share/cachyos-fish-config/cachyos-config.fish

starship init fish | source
zoxide init fish | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

fish_add_path /home/addigoat/.spicetify
fish_add_path /home/addigoat/.scripts
