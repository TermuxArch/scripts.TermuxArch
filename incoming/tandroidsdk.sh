[ -d sdk ] && cd "$HOME/sdk" || mkdir -p "$HOME/sdk" && cd "$HOME/sdk"
[ -f index.html ] || curl -OL https://developer.android.com/studio/index.html
NDKTOOLSFILE="$(grep commandlinetools-linux index.html | grep https)"
NDKTOOLSFILE="${NDKTOOLSFILE#*\"}"
NDKTOOLSFILE="${NDKTOOLSFILE%*\"}"
[ -f "${NDKTOOLSFILE##*\/}" ] || curl -OL "$NDKTOOLSFILE"
[ -f "${NDKTOOLSFILE##*\/}" ] && unzip "${NDKTOOLSFILE##*\/}"
