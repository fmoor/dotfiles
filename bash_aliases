#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias uu='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias pup='pip install --upgrade pip setuptools'
alias cb='xclip -sel clip'
alias gpg-e='gpg --encrypt --sign --armor -r fmoor@gmx.com'
alias beep='paplay /usr/share/sounds/ubuntu/notifications/Positive.ogg'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"; beep'

# Git Commands
alias ga='git add'
alias gb='git branches'
alias gd='git diff'
alias gl='git log --graph --decorate --oneline'
alias gs='git status'

venv() {
  if [ $# -gt 1 ]; then
    echo "too many arguments"
    return 1
  fi

  INTERPRETER="$1"
  if [ -z "$1" ]; then
    INTERPRETER="$__LATEST_PYTHON__"
  fi

  echo "interpreter $INTERPRETER"

  if [[ $INTERPRETER == python2* ]]; then
    CMD="virtualenv -p $INTERPRETER .venv"
  else
    CMD="$INTERPRETER -m venv .venv"
  fi

  echo "command $CMD"

  eval $CMD
  _auto_activate_virtualenv
  pup
}
