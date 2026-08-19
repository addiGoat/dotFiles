function newscript --description "Create a new executable script with chosen name"
    if test (count $argv) -lt 1
        echo "Usage: newscript [filename]"
    end

    set -l script_name $argv[1]

    touch $script_name
    chmod +x $script_name

    if test $argv[2]
        set -l language $argv[2]

        if test $argv[2] = "python"

            echo '#/usr/bin/env python3' >> $script_name
        end
        echo fuck
    end
    # $EDITOR $script_name
end
