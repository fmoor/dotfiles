#!/usr/bin/env bash

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi


_parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


_exit_code() {
    local EXIT_CODE="$?"

    local red='\[\033[01;31m\]'
    local white='\[\033[00m\]'

    if [ ${EXIT_CODE} != 0 ]; then
        echo "${red}✗ ${white}${EXIT_CODE}"
    else
        echo ""
    fi
}


_color_prompt() {
    local return_code=$(_exit_code)

    local red='\[\033[01;31m\]'
    local blue='\[\033[01;34m\]'
    local green='\[\033[01;32m\]'
    local white='\[\033[00m\]'

    export PS1="${green}\u@\h${white}:${blue}\w ${red}$(_parse_git_branch) ${return_code} ${white}\n\$ "
}


export PROMPT_COMMAND="_color_prompt;${PROMPT_COMMAND}"
