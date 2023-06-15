# conjur.bash

#PATH="$PATH:/Applications/ConjurCloudCLI.app/Contents/Resources/conjur"
if [ -x "/Applications/ConjurCloudCLI.app/Contents/Resources/conjur/conjur" ]; then
    if [ ! -x "/usr/local/bin/conjur" ]; then
	sudo ln -s -f /Applications/ConjurCloudCLI.app/Contents/Resources/conjur/conjur /usr/local/bin/conjur
    fi
fi
