# python.bash

if command -v pipx &> /dev/null; then
  # shellcheck source=/dev/null
  if [ ! -f "$SHELL_CUSTOM_DIR/pipx.bash-completion" ]; then
      register-python-argcomplete pipx > "$SHELL_CUSTOM_DIR/pipx.bash-completion"
  fi
  source "$SHELL_CUSTOM_DIR/pipx.bash-completion"
fi

