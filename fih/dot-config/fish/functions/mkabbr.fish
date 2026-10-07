#!/usr/bin/env fish

function mkabbr -a name command
    set -f alias_file "$HOME/.config/fish/conf.d/aliases.fish"

    if test -z $name
        or test -z $command
        echo "Must supply both abbreviation name, and command contents"
    end

    echo abbr "$name" "\"$command\"" >> "$alias_file"
    source "$alias_file"
end

