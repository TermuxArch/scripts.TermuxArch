#!/usr/bin/env /usr/bin/sh
## Copyright 2021 (c) by SDRausty, all rights reserved, see LICENSE
## hosting termuxarch.github.io/TermuxArch courtesy pages.github.com
################################################################################
set -eu
_SHFUNC_ () {
PERRS="$(du "$1" 2>&1 >/dev/null | sed "s/du: cannot read directory '//g" | sed "s/': Permission denied//g")"
[ -z "$PERRS" ] || { printf "%s" "Fixing  permissions in '$1': " && for PERR in $PERRS ; do chmod 755 "$PERR" ; done && printf "%s\n" "DONE" ; }
SDIRS="apex data"
for SDIR in $SDIRS
do
RMDIR="$1/$SDIR"
[ -d "$RMDIR" ] && printf "%s" "Deleting $RMDIR: " && rm -rf "${RMDIR:?}" && printf "%s\n" "DONE"
done
printf "%s\n" "Script '${0##*/}': DONE"
}
printf "%s\n" "Script '${0##*/}': STARTED..."
[ -d "$1" ] && _SHFUNC_ "$@" || printf "%s\n" "Directory '$1' does not exist; Exiting... $(exit)"
# fperms.sh EOF
