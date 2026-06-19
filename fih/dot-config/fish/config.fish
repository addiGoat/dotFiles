source ~/.config/fish/conf.d/done.fish

## Config
# format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


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
