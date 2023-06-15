
if [ -n "$INSIDE_EMACS" ]; then
    echo "WARN: inside emacs, not loading fzf."
    return 0
fi

#Append this line to ~/.bashrc to enable fzf keybindings for Bash:

source /opt/local/share/fzf/shell/key-bindings.bash

#Append this line to ~/.bashrc to enable fuzzy auto-completion for Bash:

source /opt/local/share/fzf/shell/completion.bash

