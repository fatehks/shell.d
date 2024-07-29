#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

__start=$EPOCHREALTIME

# Minimal path additions here; other path additons go in SHELL_CUSTOM_DIR files
# Add brew or macport minimal path here
if [ -d "/opt/local/bin" ]; then
    export PATH="/opt/local/bin:$PATH"
fi
if [ -d "$HOME/brew/bin" ]; then
    export PATH="$HOME/brew/bin:$PATH"
fi

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

# Load customizations from SHELL_CUSTOM_DIR
for f in $(ls $SHELL_CUSTOM_DIR/*.bash); do
    myload "$f"
done

__stop=$EPOCHREALTIME
__duration=$(echo "$__stop - $__start" | bc)
printf "Startup time: %0.6fs\n" $__duration
