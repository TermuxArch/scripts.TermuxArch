#!/usr/bin/env sh
## Copyright 2021 (c) by SDRausty, all rights reserved, see LICENSE
## hosting termuxarch.github.io/TermuxArch courtesy pages.github.com
################################################################################
set -eu
printf "%s\n" "Script '${0##*/}': STARTED..."
PERRS="$(du ~/"$1"/ 2>&1 >/dev/null | sed "s/du: cannot read directory '//g" | sed "s/': Permission denied//g")"
[ -z "$PERRS" ] || { printf "%s" "Fixing  permissions in '~/$1/': " && for PERR in $PERRS ; do chmod 755 "$PERR" ; done && printf "%s\n" "DONE" ; }
SDIRS="apex data"
for SDIR in $SDIRS
do
[ -d ~/"$1/$SDIR/" ] && printf "%s" "Deleting ~/$1/$SDIR/: " && rm -rf ~/"$1/$SDIR/" && printf "%s\n" "DONE"
done
printf "%s\n" "Script '${0##*/}': DONE"
# fperms.sh EOF
