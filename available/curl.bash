# curl.bash

## Homebrew Curl
if command -v brew &> /dev/null; then

    #curl is keg-only, which means it was not symlinked into $HOME/brew,
    #because macOS already provides this software and installing another version in
    #parallel can cause all kinds of trouble.

    #If you need to have curl first in your PATH, run:
    export PATH="$HOME/brew/opt/curl/bin:$PATH"

    #For compilers to find curl you may need to set:
    export LDFLAGS="-L$HOME/brew/opt/curl/lib"
    export CPPFLAGS="-I$HOME/brew/opt/curl/include"

    #For pkg-config to find curl you may need to set:
    export PKG_CONFIG_PATH="$HOME/brew/opt/curl/lib/pkgconfig"

fi
