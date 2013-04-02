#!/bin/bash
# MobileSubstrate Dylib Disabler
# By Ad@m <http://hbang.ws>
# Licensed under the MIT License <http://adam.mit-license.org>

if [[ "$@" == "" || "$1" == "--help" ]]; then
	echo "Usage: $(basename "$0") names of dylibs space delimited by a space"
	exit 1
fi

for i in "$@"; do
	if [[ "$i" == "MobileSafety" ]]; then
		echo "I'm sorry, Dave. I'm afraid I can't do that." >&2
	elif [[ -f "/Library/MobileSubstrate/DynamicLibraries/$i.dylib" ]]; then
		mv "/Library/MobileSubstrate/DynamicLibraries/$i.dylib" "/Library/MobileSubstrate/DynamicLibraries/$i.disabled" && echo "$i disabled."
	elif [[ -f "/Library/MobileSubstrate/DynamicLibraries/$i.disabled" ]]; then
		mv "/Library/MobileSubstrate/DynamicLibraries/$i.disabled" "/Library/MobileSubstrate/DynamicLibraries/$i.dylib" && echo "$i enabled."
	else
		echo "I can't see the dylib \"$i\" here." >&2
	fi
done
