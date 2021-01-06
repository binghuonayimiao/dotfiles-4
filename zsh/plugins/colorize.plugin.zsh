#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *b* ]] {
  PATH=$PATH:"${0:h}/bin"
}

DEPENDENCES_ARCH+=( grc )
DEPENDENCES_DEBIAN+=( grc )

export LESS="$LESS -R -M"

function ip() {
  command ip --color=auto "$@"
}

function grep() {
  command grep --colour=auto "$@"
}

function egrep() {
  command egrep --colour=auto "$@"
}

function fgrep() {
  command fgrep --colour=auto "$@"
}

if (( $+commands[diff-so-fancy] )); then
  function diff() {
    command diff "$@" | diff-so-fancy
  }
elif  (( $+commands[delta] )); then
  function diff() {
    command diff "$@" | delta
  }
else
  function diff() {
    command diff --color "$@"
  }
fi

if (( $+commands[grc] )); then
  function env() {
    command grc --colour=auto env "$@"
  }

  function lsblk() {
    command grc --colour=auto lsblk "$@"
  }

  function df() {
    command grc --colour=auto df -h "$@"
  }

  function du() {
    command grc --colour=auto du -h "$@"
  }

  function free() {
    command grc --colour=auto free -h "$@"
  }

  function as() {
    command grc --colour=auto as "$@"
  }

  if (( $+commands[dig] )); then
    function dig() {
      command grc --colour=auto dig "$@"
    }
  fi

  if (( $+commands[gas] )); then
    function gas() {
      command grc --colour=auto gas "$@"
    }
  fi

  if (( $+commands[gcc] )); then
    function gcc() {
      command grc --colour=auto gcc "$@"
    }
  fi

  if (( $+commands[g++] )); then
    function g() ++(){
      command grc --colour=auto g++ "$@"
    }
  fi

  if (( $+commands[last] )); then
    function last() {
      command grc --colour=auto last "$@"
    }
  fi

  if (( $+commands[ld] )); then
    function ld() {
      command grc --colour=auto ld "$@"
    }
  fi

  if (( $+commands[ifconfig] )); then
    function ifconfig() {
      command grc --colour=auto ifconfig "$@"
    }
  fi

  if (( $+commands[mount] )); then
    function mount() {
      command grc --colour=auto mount "$@"
    }
  fi

  if (( $+commands[mtr] )); then
    function mtr() {
      command grc --colour=auto mtr "$@"
    }
  fi

  if (( $+commands[netstat] )); then
    function netstat() {
      command grc --colour=auto netstat "$@"
    }
  fi

  if (( $+commands[nmap] )); then
    function nmap() {
      command grc --colour=auto nmap "$@"
    }
  fi

  if (( $+commands[ping] )); then
    function ping() {
      command grc --colour=auto ping "$@"
    }
  fi

  if (( $+commands[ping6] )); then
    function ping6() {
      command grc --colour=auto ping6 "$@"
    }
  fi

  if (( $+commands[ps] )); then
    function ps() {
      command grc --colour=auto ps "$@"
    }
  fi

  if (( $+commands[traceroute] )); then
    function traceroute() {
      command grc --colour=auto traceroute "$@"
    }
  fi
fi
iles the tty of the preprocessor will be supended.
        # Therefore we must source this file to make colorize_cat available in the
        # preprocessor without the interactive mode.
        # `2>/dev/null` will suppress the error for large files 'broken pipe' of the python
        # script pygmentize, which will show up if less has not fully "loaded the file"
        # (e.g. when not scrolled to the bottom) while already the next file will be displayed.
        local LESSOPEN="| zsh -c 'source \"$ZSH_COLORIZE_PLUGIN_PATH\"; \
        ZSH_COLORIZE_TOOL=$ZSH_COLORIZE_TOOL ZSH_COLORIZE_STYLE=$ZSH_COLORIZE_STYLE \
        colorize_cat %s 2> /dev/null'"

        # LESSCLOSE will be set to prevent any errors by executing a user script
        # which assumes that his LESSOPEN has been executed.
        local LESSCLOSE=""

        LESS="$LESS" LESSOPEN="$LESSOPEN" LESSCLOSE="$LESSCLOSE" less "$@"
    }

    if [ -t 0 ]; then
        _cless "$@"
    else
        # The input is not associated with a terminal, therefore colorize_cat will
        # colorize this input and pass it to less.
        # Less has now to decide what to use. If any files have been provided, less
        # will ignore the input by default, otherwise the colorized input will be used.
        # If files have been supplied and the input has been redirected, this will
        # lead to unnecessary overhead, but retains the ability to use the less options
        # without checking for them inside this script.
        colorize_cat | _cless "$@"
    fi
}
