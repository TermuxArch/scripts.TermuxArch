#!/usr/bin/env sh
set -eu
PERRS="$(du ~/archi/ 2>&1 >/dev/null | sed "s/du: cannot read directory '//g" | sed "s/': Permission denied//g")" ; for PERR in $PERRS ; do chmod 755 "$PERR" ; done
if [ -d ~/archi/data/ ]
then
PDERRS="$(find ~/archi/data/ -type f )" ; for PDERR in $PDERRS ; do printf "%s" "$PDERR" ; done
else
PDERRS=""
fi
printf "%s" "$PERRS"
printf "%s" "$PDERRS"
# fperms.sh EOF
