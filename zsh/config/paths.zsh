#!/usr/bin/env zsh
# ============================================================================= #
#  ➜ ➜ ➜ PATHS
# ============================================================================= #
# Usage: indirect_expand PATH -> $PATH
indirect_expand() {
    env | sed -n "s/^$1=//p"
}

# Usage: pathremove /path/to/bin [PATH]
# Eg, to remove ~/bin from $PATH
#     pathremove ~/bin PATH
pathremove() {
    local IFS=':'
    local newpath
    local dir
    local var=${2:-PATH}
    # Bash has ${!var}, but this is not portable.
    for dir in $(indirect_expand "$var"); do
        IFS=''
        if [ "$dir" != "$1" ]; then
            newpath=$newpath:$dir
        fi
    done
    export $var=${newpath#:}
}

# Usage: pathprepend /path/to/bin [PATH]
# Eg, to prepend ~/bin to $PATH
#     pathprepend ~/bin PATH
pathprepend() {
    # if the path is already in the variable,
    # remove it so we can move it to the front
    pathremove "$1" "$2"
    #[ -d "${1}" ] || return
    local var="${2:-PATH}"
    local value=$(indirect_expand "$var")
    export ${var}="${1}${value:+:${value}}"
}

# Usage: pathappend /path/to/bin [PATH]
# Eg, to append ~/bin to $PATH
#     pathappend ~/bin PATH
pathappend() {
    pathremove "${1}" "${2}"
    #[ -d "${1}" ] || return
    local var=${2:-PATH}
    local value=$(indirect_expand "$var")
    export $var="${value:+${value}:}${1}"
}

# ============================================================================ #

[[ -d "$HOME/go" ]] && export GOPATH="$HOME/go"
[[ -d "/usr/local/go" ]] && export GOROOT="/usr/local/go"

[[ -d "$HOME/.cargo" ]] && pathprepend "$HOME/.cargo/bin" PATH

[[ -d "$GOPATH" ]] && pathprepend "$GOROOT:$GOPATH/bin" PATH

[[ -d "$HOME/.pyenv" ]] && export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$HOME/.pyenv" ]] && pathprepend "$PYENV_ROOT/bin" PATH

[[ -d "$HOME/.rbenv" ]] && pathprepend "$HOME/.rbenv/bin" PATH

[[ -d "$HOME/.nvm" ]] && export NVM_DIR="$HOME/.nvm"

[[ -d "$HOME/.dotfiles" ]] && export DOTFILES=".dotfiles"
[[ -d "$HOME/$DOTFILES/bin" ]] && pathprepend "$HOME/$DOTFILES/bin" PATH
[[ -d "$HOME/.local/bin" ]] && pathprepend "$HOME/.local/bin" PATH
[[ -d "$HOME/.bin" ]] && pathprepend "$HOME/.bin" PATH

## The current directory should never be in $PATH
pathremove . PATH
pathremove "" PATH

# ============================================================================ #

## Clean up
unset indirect_expand pathremove pathappend pathprepend
