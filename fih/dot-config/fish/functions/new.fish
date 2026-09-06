function new
    set -f current_dir $PWD
    set -f template_dir ~/Templates
    set -f templates (command eza -1 $template_dir/* | string replace --regex '^/home/addigoat/Templates/' '')
    set -f chosen_template
    
    if test -z $argv
        set -f chosen_template (printf "%s\n" $templates | fzf)
        set -f template_extension (string split -r -m1 -f2 . $chosen_template)
        echo $chosen_template
        echo $template_extension
        
        # read only splits on newlines and i can't figure out how to make it split on spaces
        # this is my crummy solution for now, it just splits the read output on space chars,
        # then joins the output of split with dashes for better cli interaction with files
        # it's ugly as hell and really gnarly but hey, it gets the job done
        set -f file_name (
                string join - (
                    string split ' ' (
                        read -P "File name: "
                )
            )
        )
        cp $template_dir/$chosen_template $current_dir/$file_name.$template_extension
    end
end
