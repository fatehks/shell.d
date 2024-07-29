# local.bash

    
export PATH="$HOME/bin:$PATH:$HOME/.local/bin"

shopt -u hostcomplete && complete -F _ssh ssh slogin autossh kssh
