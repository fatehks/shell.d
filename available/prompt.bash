# prompt.bash

# Time-stamp: <2023-06-14 16:03:01 david.hisel>

PROMPT_BASH_SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Colors are defined in colors.bash (Note: colors work inside emacs shell)
# REF: https://github.com/Bash-it/bash-it/blob/master/lib/colors.bash
source $PROMPT_BASH_SCRIPT_DIR/lib/colors.bash

# REF: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source $PROMPT_BASH_SCRIPT_DIR/lib/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h - \n${cyan}\T ${bold_white}\w${white} ${bold_green}" "${bold_white}\n\$ "'


