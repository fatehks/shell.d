# stern.bash

# this script is intended to be sourced from inside .bash_profile

# Example:  $ source stern.bash

# https://github.com/wercker/stern

if command -v stern &> /dev/null; then
    # shellcheck source=/dev/null
    source <(stern --completion=bash)
fi
