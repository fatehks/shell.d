# completion.bash


if [ -n "${INSIDE_EMACS}" ]; then
	return
fi

# Brew
__completion_paths="${__completion_paths} ${HOME}/brew/etc/profile.d/bash_completion.sh" 

# Macports
__completion_paths="${__completion_paths} /opt/local/etc/profile.d/bash_completion.sh"

# Linux
__completion_paths="${__completion_paths} /etc/profile.d/bash_completion.sh"


for f in ${__completion_paths}; do
	if [ -f "$f" ]; then
		source $f
		break
	fi
done

unset __completion_paths

