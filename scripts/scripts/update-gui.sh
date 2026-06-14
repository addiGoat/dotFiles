#!/usr/bin/env bash

#yad --about \
#	--pversion="1.0.1" \
#	--copyright="Copyright (c) 2026 addiGoat" \
#	--pname="addiGoat Dev" \
#	--authors="addiGoat (you know me ;3)"


update_rows=()


while read -r pkg old arrow new; do
	update_rows+=("AUR" "$pkg" "$old" "$new")
done < <(paru -Qua | sed -r 's/\x1B\[[0-9;]*[A-Za-z]//g')

while read -r pkg old arrow new; do
	update_rows+=("Arch" "$pkg" "$old" "$new")
done < <(checkupdates | sed -r 's/\x1B\[[0-9;]*[A-Za-z]//g')



yad --list --no-click --no-selection \
	--width=500 --height=600 \
	--button="Install:0" --button="Later:1" \
	--column=Source \
	--column=Package \
	--column="Old Ver" \
	--column="New Ver" \
	"${update_rows[@]}"

status=$?
echo $status

case "$status" in
	0)
		# Install
		NO_FETCH=1 kitty --hold --title="System Update" -e /home/addigoat/.scripts/update-system.sh 
		;;
	1)
		# Cancel
		echo "user chose later"
		;;
	252)
		# Esc/X button
		echo "user hit excape"
		;;
esac
