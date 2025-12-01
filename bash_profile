#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Set this to "true" to display the timing of the loads
SHOW_TIMER="true"

# Set this to where the custom shell scripts are installed
export SHELL_CUSTOM_DIR="$HOME/.shell.d"
export SHELL_CUSTOM_LIB_DIR="$SHELL_CUSTOM_DIR/lib"

__t_profile_start="$EPOCHREALTIME"

function load {
    local __t_start="$EPOCHREALTIME"

    # shellcheck disable=SC1090
    source "$1"

    local __t_stop="$EPOCHREALTIME"
    local __t_duration=$(echo -n "${__t_stop:0} - ${__t_start:0}" | bc -l)
    [ "$SHOW_TIMER" = "true" ] && printf "%-20s: %0.6fs\n" "$(basename $1)" "$__t_duration"
}

# Add settings to local.bash to with absolute minimal settings to
# ensure this bash profile can work
# For example, set PATH to add brew or macports or other paths needed
# by other scripts; keep all other logic in custom settings files
load "$SHELL_CUSTOM_DIR/enabled/local.bash"

# Load customizations from SHELL_CUSTOM_DIR
shopt -s extglob
for f in "$SHELL_CUSTOM_DIR"/enabled/*.bash; do
    if [[ "$(basename "$f")" == local* ]]; then
	continue
    fi
    load "$f"
done

load "$SHELL_CUSTOM_DIR/enabled/local-post.bash"

# De-duplicate PATH and keep the paths in the same order; dupes after first occurrence will be removed
PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!a[$0]++ {if (NR>1) printf(":"); printf("%s", $0)}')

__t_profile_stop="$EPOCHREALTIME"
__t_profile_duration=$(echo -n "${__t_profile_stop:0} - ${__t_profile_start:0}" | bc -l)
printf "%-20s: %0.6fs\n" "Startup time" "$__t_profile_duration"

# Cleanup
unset -f load

# __END__
