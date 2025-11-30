# local.bash

# Check macports
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Check brew
PATH=/opt/homebrew/bin:$PATH

# My home bin should be searched first
PATH=$HOME/bin:$PATH

export PATH
