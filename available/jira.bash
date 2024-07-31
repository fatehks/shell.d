# jira.bash

source $HOME/.jira-creds.txt

if [ -z "$JIRA_URL" ]; then
	return
fi

# jira commandline
# REF: <https://github.com/go-jira/jira>

if ! command -v jira &> /dev/null ; then
	go install github.com/go-jira/jira/cmd/jira@latest
fi

if [ ! -f "$SHELL_CUSTOM_DIR/jira.bash-completion" ]; then
	jira --completion-script-bash > "$SHELL_CUSTOM_DIR/jira.bash-completion" 
fi
source "$SHELL_CUSTOM_DIR/jira.bash-completion" 



if [ ! -d "$HOME/.jira.d" ]; then
	mkdir $HOME/.jira.d
fi
if [ ! -f "$HOME/.jira.d/config.yml" ]; then
	echo "endpoint: $JIRA_URL" > $HOME/.jira.d/config.yml
	echo "login: $JIRA_USER" >> $HOME/.jira.d/config.yml
	echo "user: $JIRA_USER" >> $HOME/.jira.d/config.yml
	echo "password-source: stdin" >> $HOME/.jira.d/config.yml
fi

#echo "$JIRA_PASS" | jira login 
