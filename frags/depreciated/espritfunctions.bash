#!/usr/bin/env bash
# Copyright 2017-2020 by SDRausty. All rights reserved.  🌎 🌍 🌏 🌐 🗺
# Hosted sdrausty.github.io/TermuxArch courtesy https://pages.github.com
# https://sdrausty.github.io/TermuxArch/README has info about this project.
# https://sdrausty.github.io/TermuxArch/CONTRIBUTORS Thank you for your help.
################################################################################
addlangq() {
	while true
	do
		printf "\\e[1;34m  Add languages to the Arch Linux system? To edit \\e[1;32m/etc/locale.gen\\e[1;34m for your preferred language(s) before running \\e[1;32mlocale-gen\\e[1;34m choose edit.  Would you like to run \\e[1;32mlocale-gen\\e[1;34m with the English en_US.UTF-8 locale only?  "
		read -n 1 -p "Answer yes to generate the English en_US.UTF-8 locale only [Y|e] " ye
		if [[ "$ye" = [Yy]* ]] || [[ "$ye" = "" ]]
		then
			break
		elif [[ "$ye" = [Ee]* ]] || [[ "$ye" = [Nn]* ]]
		then
			printf "\\e[0m"
			"$ed" "$INSTALLDIR"/etc/locale.gen
			sleep 1
			break
		else
			printf "\\nYou answered \\e[1;36m$ye\\e[1;32m.\\n"
			sleep 1
			printf "\\nAnswer yes to run, or edit to edit the file [Y|e]\\n"
		fi
	done
}

_COPYSTARTBIN2PATHQ_() {
	while true
	do
	printf "\\e[0;34m 🕛 > 🕚 \\e[0mCopy \\e[1m$STARTBIN\\e[0m to \\e[1m$BPATH\\e[0m?  "'\033]2; 🕛 > 🕚 Copy to $PATH [Y|n]?\007'
	read -n 1 -p "Answer yes or no [Y|n] " answer
	if [[ "$answer" = [Yy]* ]] || [[ "$answer" = "" ]]
	then
		cp "$INSTALLDIR/$STARTBIN" "$BPATH"
		printf "\\n\\e[0;34m 🕛 > 🕦 \\e[0mCopied \\e[1m$STARTBIN\\e[0m to \\e[1m$BPATH\\e[0m.\\n\\n"
		break
	elif [[ "$answer" = [Nn]* ]] || [[ "$answer" = [Qq]* ]]
	then
		printf "\\n"
		break
	else
		printf "\\n\\e[0;34m 🕛 > 🕚 \\e[0mYou answered \\e[33;1m$answer\\e[0m.\\n\\n\\e[0;34m 🕛 > 🕚 \\e[0mAnswer yes or no [Y|n]\\n\\n"
	fi
	done
}

_RUNFINISHSETUPQ_() {
	while true
	do
		printf "\\n\\e[0;32mWould you like to run \\e[1;32mfinishsetup.bash\\e[0;32m to complete the Arch Linux configuration and update now, or at a later time?  \\e[1;32mNow is recommended.  \\e[0;32m"
		read -n 1 -p "Answer yes to complete the Arch Linux configuration and update now; Or answer no for later [Y|n] " nl
	if [[ "$nl" = [Yy]* ]] || [[ "$nl" = "" ]]
	then
		_RUNFINISHSETUP_
		break
	elif [[ "$nl" = [Nn]* ]]
	then
		printf "\\n\\e[0;32mSet the geographically nearby CMIRROR in \\e[1;32m/etc/pacman.d/mirrorlist\\e[0;32m first.  Then use \\e[1;32m$INSTALLDIR/root/bin/setupbin.bash\\e[0;32m in Termux to run \\e[1;32mfinishsetup.bash\\e[0;32m or simply \\e[1;32mfinishsetup.bash\\e[0;32m in Arch Linux Termux PRoot to complete the Arch Linux configuration and update."
		break
	else
		printf "\\nYou answered \\e[1;36m$nl\\e[1;32m.\\n"
		sleep 1
		printf "\\nAnswer yes to complete, or no for later [Y|n]\\n"
	fi
	done
	printf '\\n'
}

spinner() {
	:
}

spinnerdepreciated() { # Based on https://github.com/ringohub/sh-spinner
 	printf "\\e[?25l\\e[1;32m"
#  	SPINNER="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
#  	SPINNER="🌑🌒🌓🌔🌕🌖🌗🌘"
#  	SPINNER="🕛🕧🕐🕜🕑🕝🕓🕟🕔🕠🕕🕡🕖🕢🕗🕣🕘🕤🕙🕥🕚🕦"
#  	SPINNER="🕧🕜🕝🕟🕠🕡🕢🕣🕤🕥🕦"
	SPINNER="🕛🕐🕑🕓🕔🕕🕖🕗🕘🕙🕚"
	task="$1"
	msg="$2"
	while true
	do
		jobs %1 > /dev/null 2>&1
		[[ "$?" = 0 ]] || {
		printf " %s %s\\e[1;34m:\\e[1;32m %s\\e[?25h\\e[0m\\n\\n" "✓" "$task" "DONE                                "
		break
		}
		for (( i=0; i<${#SPINNER}; i++ ))
		do
			sleep 0.05
			printf " %s %s %s\\r" "${SPINNER:$i:1}" "$task" "$msg"
		done
	done
}
# espritfunctions.bash EOF
