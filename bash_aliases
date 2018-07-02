#!/usr/bin/env bash

alias pup='pip install --upgrade pip setuptools'
alias venv='python3.6 -m venv .venv && _auto_activate_virtualenv && pup'
alias venv2='virtualenv .venv && _auto_activate_virtualenv && pup'
alias cb='xclip -sel clip'
alias gpg-e='gpg --encrypt --sign --armor -r fmoor@gmx.com'
alias beep='paplay /usr/share/sounds/ubuntu/notifications/Positive.ogg'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"; beep'

# Git Commands
alias ga='git add'
alias gb='git branch' 
alias gd='git diff' 
alias gl='git log --graph --decorate --oneline'
alias gstat='git status' 
alias gstsh='git stash'
alias gpl='git pull' 
alias gplo='git pull origin master'
alias gpu='git push'
alias gpuo='git push origin master'
