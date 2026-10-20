source ~/.config/fish/conf.d/done.fish
source ~/.config/fish/path.fish
source ~/.config/fish/var.fish

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

if status is-interactive
    if set -q NVIM
        fish_default_key_bindings
    else
        function fish_user_key_bindings
            fish_vi_key_bindings insert
            bind -M default escape 'set fish_bind_mode insert; commandline -f repaint-mode'
            bind -M insert escape 'set fish_bind_mode default; commandline -f repaint-mode'
        end
    end
end

function starship_transient_prompt_func
    set_color 585b70
    printf "╭─ "
    set_color 6488C4
    printf "goat"
    set_color 585b70
    printf "\n╰─"
    set_color --bold 77a6da
    printf "❯ "
    set_color normal
end

starship init fish | source
enable_transience


zoxide init fish --cmd cd | source

