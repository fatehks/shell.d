#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

__start=$EPOCHREALTIME

# Minimal path additions here; other path additons go in SHELL_CUSTOM_DIR files
# Add brew or macport minimal path here
#export PATH="/opt/local/bin:$PATH"
export PATH="$HOME/brew/bin:$PATH"


# Custom
export SHELL_CUSTOM_DIR="$HOME/.shell.d"

function quickload {
	source $1
}
function timeload {
	printf "Loading $1..."
	__load_start=$EPOCHREALTIME
	source $1
	__load_stop=$EPOCHREALTIME
	__load_duration=$(echo "$__load_stop - $__load_start" | bc)
	printf "\t\tload time: %0.6fs\n" $__load_duration
}

# this alias is used for sourcing, set to `quickload` or `timeload`
alias myload=timeload


# Completion
if [ -r "$HOME/brew/etc/profile.d/bash_completion.sh" ]; then
  myload "$HOME/brew/etc/profile.d/bash_completion.sh"
fi
if [ -r "/opt/local/etc/profile.d/bash_completion.sh" ]; then
  myload "/opt/local/etc/profile.d/bash_completion.sh"
fi


# Load customizations from SHELL_CUSTOM_DIR
for f in $(ls $SHELL_CUSTOM_DIR/*.bash); do
    myload "$f"
done

# De-duplicate PATH -- run this after sourcing everything
# TODO: test if path ordering is the same before and after
PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

__stop=$EPOCHREALTIME
__duration=$(echo "$__stop - $__start" | bc)
printf "Startup time: %0.6fs\n" $__duration
