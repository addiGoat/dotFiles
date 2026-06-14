#!/usr/bin/env bash

PACMAN=$(checkupdates 2>/dev/null | wc -l)
AUR=$(paru -Qua 2>/dev/null | wc -l)
TOTAL=$((PACMAN + AUR))

if (( $TOTAL > 0 )); then
	response=$(notify-send "Updates Found" "There are $TOTAL updates for your system." \
		--action=default="Show" \
		--action=yes="Update")
		
	case "$response" in
		"yes")
			NO_FETCH=1 kitty --hold --title="System Update" -e  /home/addigoat/.scripts/update-system.sh
			;;
		"default")
			/home/addigoat/.scripts/update-gui.sh
			;;
	esac
fi
