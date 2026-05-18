function mkcd
    if test -z "$argv[1]"
        echo "Usage: mkcd <directory>"
        return 1
    end

    if not test -d "$argv[1]"
        mkdir "$argv[1]" || return 1
    end

    cd "$argv[1]" || return 1
end


