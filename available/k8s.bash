# k8s.bash

# this script is intended to be sourced from inside .bash_profile

# Example:  $ source k8s.bash

if command -v kubectl &> /dev/null; then
    alias k='kubectl'
    alias kconf='kubectl config current-context'
    alias kns='kubectl get namespaces'


    # kubectl plugin "krew"
    # https://krew.sigs.k8s.io/docs/user-guide/setup/install/
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

fi


########################################
# BASH COMPLETION section

## do not load completion if inside emacs
if [ -n "${INSIDE_EMACS}" ]; then
    return
fi

#https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-bash-completion

# shellcheck source=/dev/null
if [ ! -f "$SHELL_CUSTOM_DIR/kubectl.bash-completion" ]; then
    kubectl completion bash > "$SHELL_CUSTOM_DIR/kubectl.bash-completion"
fi
source "$SHELL_CUSTOM_DIR/kubectl.bash-completion"
complete -F __start_kubectl k


# shellcheck source=/dev/null
if [ ! -f "$SHELL_CUSTOM_DIR/krew.bash-completion" ]; then
    kubectl krew completion bash > "$SHELL_CUSTOM_DIR/krew.bash-completion"
fi
source "$SHELL_CUSTOM_DIR/krew.bash-completion"

if command -v kubectx &> /dev/null; then
    # add kubectx autocomplete
    if [ -f /opt/local/etc/bash_completion.d/kubectx ]; then
	source /opt/local/etc/bash_completion.d/kubectx
    fi
fi

if command -v helm &> /dev/null; then
    if [ ! -f "$SHELL_CUSTOM_DIR/helm.bash-completion" ]; then
	helm completion bash > "$SHELL_CUSTOM_DIR/helm.bash-completion"
    fi
    source "$SHELL_CUSTOM_DIR/helm.bash-completion"
fi
# To install shell completion for supported shells run: kustomize install-completion
# To uninstall shell completion: COMP_UNINSTALL=1 kustomize install-completion
if command -v kustomize &> /dev/null; then
    if [ ! -f "$SHELL_CUSTOM_DIR/kustomize.bash-completion" ]; then
	kustomize completion bash > "$SHELL_CUSTOM_DIR/kustomize.bash-completion"
    fi
    source "$SHELL_CUSTOM_DIR/kustomize.bash-completion"
fi

