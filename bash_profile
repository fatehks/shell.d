#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

__start=$EPOCHREALTIME

# Minimal path additions here; other path additons go in SHELL_CUSTOM_DIR files
# Add brew or macport minimal path here
export PATH="/opt/local/bin:$PATH"
#export PATH="$HOME/brew/bin:$PATH"

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

# De-duplicate PATH and keep the paths in the same order; dupes after first occurence will be removed
PATH=$(awk -F: 'BEGIN {split(ENVIRON["PATH"],P);r=P[1];A[r]=1;for(e=2;e<length(P)+1;e++){if(P[e] in A == 0){r=r FS P[e];A[P[e]];}};print r;}')

__stop=$EPOCHREALTIME
__duration=$(echo "$__stop - $__start" | bc)
printf "Startup time: %0.6fs\n" $__duration

