#!/usr/bin/env bash
# auto-activate-virtualenv.sh
# 
# Original insperation:
#   https://gist.github.com/codysoyland/2198913
#
# Installation:
#   Add this line to your .bashrc or .bash-profile:
#
#       source /path/to/auto-activate-virtualenv.sh
#
#   Note: direnv doesn't allow changing the prompt,
#         so adding this to .envrc wont work.
#
#   Go to your project folder, run "python3.7 -m venv .venv", so your project folder
#   has a .venv folder at the top level, next to your version control directory.
#   For example:
#   .
#   ├── .git
#   │   ├── HEAD
#   │   ├── config
#   │   ├── description
#   │   ├── hooks
#   │   ├── info
#   │   ├── objects
#   │   └── refs
#   └── .venv
#       ├── bin
#       ├── include
#       └── lib
#
#   The virtualenv will be activated automatically when you enter the directory.


# walk up the directory tree starting in the current directory
# stoping at the first match that is found.
_search_up() {
    path="$(pwd -P)"

    while [[ $path != / ]]; do
        _VENV_DIR="$(find "$path" -maxdepth 1 -mindepth 1 "$@" -print -quit)"
        
        if [ -n "$_VENV_DIR" ]; then
            echo $_VENV_DIR
            return 0
        fi
        
        path="$(readlink -f "$path"/..)"
    done
    
    return 1
}


# Deactivate old environment if there was one activated.
_deactivate_if_activated() {
    if [ "$(type -t deactivate)" = function ]; then
        # deactivate uses this variable to reset the prompt.
        _OLD_VIRTUAL_PS1="$PS1"

        deactivate
    fi
}


# Add the project name as the venv name to the prompt.
_update_prompt() {
    local name=$1

    if [ -z ${name+x} ]; then
        PS1=$PS1
    else
        PS1="($name) $PS1"
    fi

    export PS1
}


denv() {
    export __VENV_DEACTIVATED__=true
}


aenv() {
    export __VENV_DEACTIVATED__=false
}


_auto_activate_virtualenv() {
    # Support both venv and .venv conventions.

    if [ "$__VENV_DEACTIVATED__" = "true" ]; then
        _deactivate_if_activated
        return 0
    fi

    local _VENV_DIR="$(_search_up  \( -name ".venv" -o -name "venv" \))"
    
    if [ "$?" -ne 0 ]; then
        # no virtualenv was found
        _deactivate_if_activated
        return 0
    fi
    
    # Make sure it's really a venv
    if [ ! -f "$_VENV_DIR/bin/activate" ]; then
        return 0
    fi

    _PROJECT_DIR=$(readlink -f "$_VENV_DIR"/..)
    _VENV_NAME=$(basename ${_PROJECT_DIR})

    # Check to see if the venv found is already activated.
    if [ "$VIRTUAL_ENV" = "$_VENV_DIR" ]; then
        _update_prompt ${_VENV_NAME}
        return 0
    fi

    _deactivate_if_activated

    # Tell activate not to change the prompt.
    VIRTUAL_ENV_DISABLE_PROMPT=1

    source $_VENV_DIR/bin/activate
    
    # Bail if the new virtualenv didn't take effect.
    if [ "$VIRTUAL_ENV" != "$_VENV_DIR" ]; then
        (>&2 echo "could not activate virtualenv: $_VENV_DIR")
        return 1
    fi

    _update_prompt ${_VENV_NAME}
}

export PROMPT_COMMAND="${PROMPT_COMMAND}_auto_activate_virtualenv"

