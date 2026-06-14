#!/usr/bin/env bash
while IFS= read -r event; do
    case "$event" in
        workspace'>>'*)
            workspace_id=${event#workspace}
            
            if [[ "${workspace_id//>>}" =~ ^([6-9]|10)$ ]]; then
                echo "open waybar floating config"
            else
                echo "open waybar standard config"
            fi
            ;;
    esac
done < <(socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock")

