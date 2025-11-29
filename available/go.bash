# GO Lang

if ! command -v go &> /dev/null; then
    return
fi

export PATH="$HOME/go/bin:$PATH"

# <https://github.com/traefik/yaegi>
if command -v yaegi &> /dev/null; then
    if command -v rlwrap &> /dev/null; then
	     alias yaegi='rlwrap yaegi'
    fi
fi
