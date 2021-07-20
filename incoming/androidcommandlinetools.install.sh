#!/usr/bin/env sh
[ -d sdk ] && cd "$HOME/sdk" || mkdir -p "$HOME/sdk" && cd "$HOME/sdk"
PAGES="ndk sdk studio"
for ONEPAGE in $PAGES
do
if [ -f "$ONEPAGE" ]
then
printf "Already got page %s from https://developer.android.com/%s:  Continuing...\\n" "$ONEPAGE" "$ONEPAGE"
else
printf "Getting page %s from https://developer.android.com/%s...\\n" "$ONEPAGE" "$ONEPAGE"
curl -OL "https://developer.android.com/$ONEPAGE"
fi
done
NDKTOOLSFILE="$(grep commandlinetools-linux studio | grep https)"
NDKTOOLSFILE="${NDKTOOLSFILE#*\"}"
NDKTOOLSFILE="${NDKTOOLSFILE%*\"}"
[ -f "${NDKTOOLSFILE##*\/}" ] || curl -OL "$NDKTOOLSFILE"
[ -f "$HOME/sdk/cmdline-tools/source.properties" ] && grep "Android" "$HOME/sdk/cmdline-tools/source.properties" && printf "%s\\n" "File ${NDKTOOLSFILE##*\/} is downloaded and unzipped." || unzip "${NDKTOOLSFILE##*\/}"
