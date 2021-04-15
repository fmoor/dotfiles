#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# initialize direnv
# requires 'apt install direnv'
eval "$(direnv hook bash)"

# load nvm
# https://github.com/nvm-sh/nvm#install--update-script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#################
### variables ###
#################
export BAT_THEME=Nord
export EDITOR=vim
export GOPATH="$HOME/.go"
export GPG_TTY=$(tty)
export PATH="$HOME/.node_modules_global/bin:$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.edgedb/bin"
export PYTHONDONTWRITEBYTECODE=true
export PIPENV_VENV_IN_PROJECT=true
export __LATEST_PYTHON__="3.8"


###############
### aliases ###
###############

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias less='less --RAW-CONTROL-CHARS'  # preserve colors
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF1'
alias bb=byobu
alias uu='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias pup='pip install --upgrade pip setuptools'
alias cb='xclip -sel clip'
alias ydlmp3='youtube-dl --extract-audio --audio-format mp3'
alias gpg-e='gpg --encrypt --sign --armor -r fmoor@gmx.com'
alias beep='paplay /usr/share/sounds/gnome/default/alerts/drip.ogg'
alias vim='nvim'

# Git Commands
alias ga='git add'
alias gd='git diff'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)"'
alias gs='git status'

# vitrualenv commands
alias va='source .venv/bin/activate'
alias vd=deactivate
alias vr='rm -rf .venv/'


#################
### functions ###
#################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alert() {
    local EXIT_CODE=$?
    notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n 1 | sed 's/[0-9]//g')"
    beep
    return $EXIT_CODE
}

# mkdir && cd
mcd() {
    mkdir -p -- "$1"
    cd -P -- "$1"
}

# create a virtualenv
vc() {
  if [ "$#" -gt 1 ]; then
    echo "usage: venv [INTERPRETER]"
    echo "error: too many arguments"
    return 1
  fi

  INTERPRETER="$1"
  if [ -z "$1" ]; then
    INTERPRETER="$__LATEST_PYTHON__"
  fi

  if [ "$INTERPRETER" == 2* ]; then
    CMD="virtualenv -p python$INTERPRETER .venv"
  else
    CMD="python$INTERPRETER -m venv .venv"
  fi

  eval $CMD
  .venv/bin/pip install --upgrade pip setuptools
}


# the following functions are prompt related
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# when sourced multiple times only add the prompt command once.
# adding it multiple times breaks displaying the error code
if [[ "$PROMPT_COMMAND" != *"_prompt"* ]]; then
    export PROMPT_COMMAND="_prompt;$PROMPT_COMMAND"
fi


_prompt() {
    local EXIT_CODE="$?"
    if [ "$EXIT_CODE" == 0 ]; then
        EXIT_CODE=""
    fi

    local VENV=""
    if [[ $VIRTUAL_ENV == *venv ]]; then
        VENV="($(basename $(dirname $VIRTUAL_ENV))) "
    elif [ ! -z "$VIRTUAL_ENV" ]; then
        VENV="($(basename $VIRTUAL_ENV)) "
    fi

    local RED='\e[01;31m'
    local GREEN='\e[01;32m'
    local YELLOW='\e[01;33m'
    local BLUE='\e[01;34m'
    local WHITE='\e[00;37m'

    export PS1="$WHITE$VENV$GREEN\u@\h$WHITE:$BLUE\w$YELLOW`__git_ps1 \" %s\"` $RED$EXIT_CODE$WHITE\n$ "
}
source "$HOME/.cargo/env"
