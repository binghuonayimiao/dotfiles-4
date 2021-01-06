# TERM Colors
export TERM="xterm-256color"
#export TERM="xterm-color"

# Personal information
export NAME='Salvydas Lukosius'
export EMAIL='sall@w-ss.io'
export GITHUB_USER='ss-o'
#export TRAVIS_USER=""

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export MANPATH="/usr/local/man:$MANPATH"
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Default SSH and GPG
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export GPG_TTY=$(tty)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='vim'
fi

export PAGER=less
export EDITOR=nano
#export VISUAL=$EDITOR

# Language
#export LANG='en_GB.UTF-8'
#export LC_ALL=$LANG
#export LANGUAGE=$LANG
#export LC_COLLATE=$LANG
#export LC_CTYPE=$LANG
#export LC_MESSAGES=$LANG
#export LC_MONETARY=$LANG
#export LC_NUMERIC=$LANG
#export LC_TIME=$LANG
