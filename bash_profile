#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

set -a

# Set this to where the custom shell scripts are installed
SHELL_CUSTOM_DIR="$HOME/.shell.d"
SHELL_CUSTOM_LIB_DIR="$HOME/.shell.d/lib"

# Set this to "true" to display the timing of the loads
SHOW_TIMER="true"

# bare-bones timer functionality using an assoc array
declare -A __timer
timer_start() { __timer["${1}_start"]="$EPOCHREALTIME"; }
timer_stop()  { __timer["${1}_stop"]="$EPOCHREALTIME";  }
timer_duration() {
  echo -n "${__timer[${1}_stop]:0} - ${__timer[${1}_start]:0}" | bc -l
}
timer_show() {
  [ "$SHOW_TIMER" = "true" ] && printf "%-20s: %0.6fs\n" "${1}" "$(timer_duration "${2}")"
}

timer_start "profile"

function load {
  timer_start "load"

  # shellcheck disable=SC1090
  source "$1"

  timer_stop "load"
  timer_show "$(basename "$1")" "load"
}

# Get minimum locals setup
# Set PATH to brew or macports or other paths needed by other scripts
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

timer_stop "profile"
SHOW_TIMER="true" timer_show "Startup time" "profile"

# Cleanup
unset -f load
unset -f timer_start
unset -f timer_stop
unset -f timer_duration
unset -f timer_show

# __END__
