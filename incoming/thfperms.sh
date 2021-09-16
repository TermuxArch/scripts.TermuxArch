#!/usr/bin/env sh
## Copyright 2021 (c) by SDRausty, all rights reserved, see LICENSE
## hosting termuxarch.github.io/TermuxArch courtesy pages.github.com
################################################################################
mkdir ~/"$1"/apex
mkdir ~/"$1"/data
touch ~/"$1"/apex/file
touch ~/"$1"/data/file
chmod 000 ~/"$1"/apex/
chmod 000 ~/"$1"/data/
# thfperms.sh EOF
