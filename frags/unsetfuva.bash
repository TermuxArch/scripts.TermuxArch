#!/usr/bin/env bash
# copyright 2017-2020 (c) by SDRausty, all rights reserved, see LICENSE
# hosting termuxarch.github.io/TermuxArch courtesy pages.github.com
# https://termuxarch.github.io/TermuxArch/CONTRIBUTORS thank you for helping
# command 'setupTermuxArch h[elp]' has information how to use this file
################################################################################
IFS=$'\n\t'
set -Eeuo pipefail
shopt -s nullglob globstar
umask 022
VERSIONID=2.0.553
_CHKSELF_() {	# compare file setupTermuxArch and the file being used
	cd "$WFDIR" # change directory to where file resides
	if [[ "$(<$TAMPDIR/setupTermuxArch)" != "$(<$0)" ]] # files differ
	then	# find and unset functions
# 		unset -f $(grep \_\( "$0"|cut -d"(" -f 1|sort -u|sed ':a;N;$!ba;s/\n/ /g')
# 		# find variables
# 		UNVAR="$(grep '="' "$0"|grep -v -e \] -e ARGS -e CPUABI -e INSTALLDIR -e ROOTDIR -e TAMPDIR -e VERSIONID -e WDIR|grep -v +|sed 's/declare -a//g'|sed 's/declare//g'|sed 's/export//g'|sed -e "s/[[:space:]]\+//g"|cut -d"=" -f 1|sort -u)"
# 		# unset variables
# 		for UNSET in $UNVAR
# 		do
# 			unset "$UNSET"
# 		done
		# update working file
		cp "$TAMPDIR/setupTermuxArch" "$0"
		rm -rf "$TAMPDIR"
		cd "$WDIR"
		[[ -z "${ARGS:-}" ]] && printf "\\e[1;32mFile \\e[0;32m'%s'\\e[1;32m UPDATED\\e[1;34m:\\e[0;32m run 'bash %s' again if this automatic update was unsuccessful.\\n\\e[1;32mRESTARTED \\e[0;32m'%s'\\e[1;34m:\\e[1;32m CONTINUING...\\n\\n\\e[0m" "${0##*/}" "${0##*/}" "${0##*/}" || printf "\\e[0;32m'%s'\\e[1;32m UPDATED\\e[1;34m:\\e[0;32m run 'bash %s' again if this automatic update was unsuccessful.\\n\\e[1;32mRESTARTED \\e[0;32m'%s'\\e[1;34m:\\e[1;32m CONTINUING...\\n\\n\\e[0m" "${0##*/} $ARGS" "${0##*/} $ARGS" "${0##*/} $ARGS"
		# restart with updated version
		. "$0" "$ARGS"
	fi
	cd "$TAMPDIR"
}
## File 'uprTermuxArch' will execute 'git pull' and populate git repository modules, and file 'uprTermuxArch' can be run directly in a PRoot environment.  File uprTermuxArch's functions are not related to updating functions run by command 'setupTermuxArch r[e[fresh]]' that have completely different update functions.  The command 'setupTermuxArch r[e[fresh]]' attempts to refresh the Arch Linux in Termux PRoot installation and the TermuxArch generated scripts to the newest version.  It also helps in the installation and configuration process if everything did not go smoothly on the first try to install Arch Linux in Termux PRoot.
## Files 'setupTermuxArch{.bash,.sh}' are held for backward compatibility;  Please reference file 'setupTermuxArch' as the chosen install file if aid and assistance be through sharing insight about this Arch Linux in a Termux PRoot container project which can be used on a smartphone, smartTV, tablet, wearable and more.  File 'setupTermuxArch' is earmarked as the install file name for this project.
## File 'setupTermuxArch' downloads as files 'setupTermuxArch.[bin,\ \(1\),\ \(2\),etc...]' through Internet browsers into Android Downloads on smartphone and Arch Linux in Termux PRoot can be installed directly from this file in Android with this command 'bash ~/storage/downloads/setupTermuxArch.bin' and similar which may also check whether there is a newer version automatically since the time it was downloaded.  If there is a newer version, this file might self update.  If this updating process went smoothly, this file will restart the process that was initially initiated by the user.
## These files 'setupTermuxArch[.{bash,sh}]' will NOT selfupdate to the most recent version published if they are used inside their git repository;  In this case 'git pull' or 'uprTermuxArch' can be employed to update to the newest published version.
## Very many hardy thank yous to contributors who are helping and have already helped to make this open source resource better!  Please accept a wholehearted thank you for using this product!
# The name of file 'setupTermuxArch' in the EOF line at the end of this file is to assist scripts 'setupTermuxArch[.{bash,bin,sh}]' when they selfupdate to the latest version when the user runs them.
# setupTermuxArch EOF
