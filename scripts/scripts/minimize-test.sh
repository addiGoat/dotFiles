windows=$(hyprctl -j clients | jq -r '.[] | "\(.title)|\(.address)|\(.workspace.name)"')

selection="$(echo "$windows" | rofi -dmenu)"

address="$(cut -d'|' -f2 <<< "$selection")"
workspace="$(cut -d'|' -f3 <<< "$selection")"
active_workspace="$(hyprctl -j activeworkspace | jq -r '.id')"

if [[ "$workspace" == "special:minimize" ]]; then
	hyprctl dispatch movetoworkspacesilent "$active_workspace,address:$address"
fi
