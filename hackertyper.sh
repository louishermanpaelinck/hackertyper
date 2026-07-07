#!/bin/bash

INPUT=""
AUTO=0

loop() {
	printf "\033c"
	for i in $(seq 0 ${#TEXT}); do

		if [ $AUTO -eq 0 ]; then
			read -s -n 1 INPUT
			H=$(printf '%d' "'$INPUT")
			if [ "$H" == "1" ]; then
				AUTO=$((1-AUTO))
			fi
		fi

		printf "${1:$i:1}"

		if [ $AUTO -eq 1 ]; then
			usleep 50000
		fi
	done
}

displayHelp() {
	echo -e "\nHackerTyper"
	echo -e "A terminal clone of the original HackerTyper for web\n"
	echo -e "Usage:"
	echo -e "\tJust start typing!"
	echo -e "\tTo activate auto-mode press ctrl-a and to stop press ctrl+c\n"
	echo -e "flags:"
	echo -e "\t--help\t\tdisplay help"
	echo -e "\t--auto\t\tstart in auto-mode\n"
}

checkIntr() {
	if [ $AUTO -eq 1 ]; then
		AUTO=0
	else
		exit
	fi
}

TEXT="$(cat kernel.txt)"

trap checkIntr SIGINT

if [ "$1" = "--help" ]; then
	displayHelp
elif [ "$1" = "--auto" ]; then
	AUTO=1
	loop "$TEXT"
elif [ -z $1 ]; then
	loop "$TEXT"
fi