# conjur.bash

export __conjur="/Applications/ConjurCloudCLI.app/Contents/Resources/conjur/conjur"
if [ -x "$__conjur" ]; then
    if [ ! -x "/usr/local/bin/conjur" ]; then
	sudo ln -s -f "$__conjur" /usr/local/bin/conjur
    fi
fi

unset __conjur

