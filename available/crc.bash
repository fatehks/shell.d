# crc.bash

# this script is intended to be sourced from inside .bash_profile

# no completion needed inside emacs
if [ -n "${INSIDE_EMACS}" ]; then
    return
fi

if command -v crc &> /dev/null; then
    if [ ! -f "$SHELL_CUSTOM_DIR/crc.bash-completion" ]; then
	crc completion bash > "$SHELL_CUSTOM_DIR/crc.bash-completion"
    fi
    source "$SHELL_CUSTOM_DIR/crc.bash-completion"
fi
