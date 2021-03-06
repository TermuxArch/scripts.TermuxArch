#!/bin/bash -e
# Copyright 2017-2018 by SDRausty. All rights reserved.  🌎 🌍 🌏 🌐 🗺
# Hosting https://sdrausty.github.io/TermuxArch courtesy https://pages.github.com
# https://sdrausty.github.io/TermuxArch/CONTRIBUTORS Thank you for your help.
# https://sdrausty.github.io/TermuxArch/README has information about this project.
# 🕧🕐🕜🕑🕝🕒🕞🕓🕟🕔🕠🕕🕡🕖🕢🕗🕣🕘🕤🕙🕥🕚🕦🕛
# Printout statement subroutines for `setupTermuxArch.sh`.
################################################################################

printdetectedsystem ()
{
	printf "\n\033[36;1m 🕑 < 🕛 \033[1;34mDetected $(uname -m) "
	detectsystem2p
	printf "\033[31;1m$spaceMessage  \n\033[0m"
}

printdownloading ()
{
	printf "\n\033[36;1m 🕝 < 🕛 \033[1;34mActivating termux-wake-lock.  Downloading \033[36;1m$file \033[1;34mand the corresponding checksum.  \033[37;1mPending Internet connection, this might take a long while.  \n\n\033[36;1m"'\033]2;  🕝 < 🕛 Downloading the system image file and the corresponding checksum.  \007'
}

printconfigq ()
{
	printf "\n\033[36;1m 🕙 < 🕛 \033[1;34mArch Linux in Termux is installed.  Answer the following questions to complete the Arch Linux configuration.\n\n\033[0m"'\033]2; 🕙 < 🕛 Arch Linux in Termux is installed!  Complete the Arch Linux configuration.  📲 \007'
}

printmd5check ()
{
	printf "\n\033[36;1m 🕠 < 🕛 \033[1;34mChecking download integrity with md5sum.  \033[37;1mThis may take a little while.\n\n\033[36;1m"
}

printmd5error ()
{
	printf "\n\033[07;1m\033[31;1m 🔆 ERROR md5sum mismatch! The download failed and was removed!\033[36;1m  Run \`setupTermuxArch.sh\` again.  See https://sdrausty.github.io/docs/TermuxArch/md5sums for more information.  This kind of error can go away, like magic.  Waiting before executing again is recommended.  There are many reasons that generate checksum errors.  Proxies are one reason.  Mirroring and mirrors are another explaination for md5sum errors.  Either way the download did not succeed.  If this keeps repeating, change the mirror with an editor like vi in knownconfigurations.sh.  See https://sdrausty.github.io/docs/TermuxArch/mirrors for more information.  \n\n	Run \`setupTermuxArch.sh\` again.  \033[31;1mExiting...\n\033[0m"
	exit
}

printmd5success ()
{
	printf '\033]2;  🕡 < 🕛 Uncompressing Arch Linux system image file.  This will take a long time; Be patient.\007'"\n\033[36;1m 🕕 < 🕛 \033[1;34mDownload integrity: \033[36;1mOK\n\n\033[36;1m 🕡 < 🕛 \033[1;34mUncompressing \033[36;1m$file\033[37;1m.  This will take a long time.  Be patient.\n\033[0m"
}

printmismatch ()
{
	printf "\n\033[07;1m\033[31;1m 🔆 ERROR Unknown configuration!  Did not find an architecture and operating system match in\033[37;1m knownconfigurations.sh\033[31;1m!  \033[36;1mDetected $(uname -mo).  There still is hope.  Check at http://mirror.archlinuxarm.org/os/ and https://www.archlinux.org/mirrors/ for other available images and see if any match the device.  If you find a match, then please \033[37;1msubmit a pull request\033[36;1m at https://github.com/sdrausty/TermuxArch/pulls with script modifications.  Alternatively, \033[37;1msubmit a modification request\033[36;1m at https://github.com/sdrausty/TermuxArch/issues if you find a configuration match.  Please include output from \033[37;1muname -mo\033[36;1m on the device in order to expand autodetection for \033[37;1msetupTermuxArch.sh\033[36;1m.  See https://sdrausty.github.io/docs/TermuxArch/Known_Configurations for more information.\n\n	\033[36;1mRun setupTermuxArch.sh again. \033[31;1mExiting...\n\033[0m"
	exit
}

printfooter ()
{
	printf "\n\033[36;1m 🕥 < 🕛 \033[1;34mUse \033[32;1m./arch/$bin\033[1;34m from the \033[32;1m\$HOME\033[1;34m directory to launch Arch Linux in Termux for future sessions.   Alternatively copy \033[32;1m$bin\033[1;34m to the \033[32m\$PATH\033[1;34m which is, \033[37m\"$PATH\"\033[0m.\n\n"'\033]2;  Thank you for using `setupTermuxArch.sh` to install Arch Linux in Termux 📲  \007'
	copybin2path
	printf "\033[1;32m 🕛 = 🕛 \033[1;34mTermux-wake-lock released.  Arch Linux in Termux is installed.  \033[32;1m\`tzselect\`\033[1;34m assits in setting the local time zone.  https://github.com/sdrausty/TermuxArch/issues/25 \"Starting Arch Linux from Termux?\" has more information.  \n\n\033[0m"
}

