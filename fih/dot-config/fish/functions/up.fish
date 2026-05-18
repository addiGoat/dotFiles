function up
    set levels 1

    if test -n "$argv[1]"
        set levels "$argv[1]"
    end

    set path ""

    for i in (seq $levels)
        set path "../$path"
    end

    cd "$path"
end
