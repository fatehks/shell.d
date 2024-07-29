# completion.bash


if [ -n "${DISABLE_BASH_COMPLETION}" ]; then
	return
fi
if [ -n "${INSIDE_EMACS}" ]; then
	return
fi

# Linux
__completion_paths="${__completion_paths} /etc/profile.d/bash_completion.sh"

# Macports
__completion_paths="${__completion_paths} /opt/local/etc/profile.d/bash_completion.sh"

# Brew
__completion_paths="${__completion_paths} /opt/homebrew/etc/profile.d/bash_completion.sh"

# $HOME might contain spaces, so, we substitute 'HOME' literal with $HOME later
__completion_paths="${__completion_paths} HOME/brew/etc/profile.d/bash_completion.sh"


for f in ${__completion_paths}; do
    sf="${f/HOME/"$HOME"}"
	if [ -f "$sf" ]; then
		source $sf
		break
	fi
done

unset __completion_paths

