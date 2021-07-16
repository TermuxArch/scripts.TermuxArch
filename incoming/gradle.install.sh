#!/usr/bin/env sh
[ -f sdkman.install.bash ] || curl -s "https://get.sdkman.io" > sdkman.install.bash
[ -d "$HOME/u/.sdkman" ] && bash sdkman.install.bash
