# brew.bash

if !command -v brew; then
    return
fi

if [ -d "$(brew --prefix)/gnubin" ]; then
    PATH="$(brew --prefix)/gnubin:$PATH"
fi

__BREW_PREFIX__=$(brew --prefix)
PATH="$__BREW_PREFIX__/bin:$PATH"
PATH="$__BREW_PREFIX__/sbin:$PATH"
PATH="$__BREW_PREFIX__/opt/coreutils/libexec/gnubin:$PATH"
#PATH="$__BREW_PREFIX__/opt/make/libexec/gnubin:$PATH"

unset __BREW_PREFIX__


export HOMEBREW_TEMP=/Users/david.hisel/brew/tmp

