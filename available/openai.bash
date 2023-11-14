# openai.bash

if [ -f $HOME/.openai/api-token ]; then
    export OPENAI_API_KEY=$(cat $HOME/.openai/api-token)
fi
