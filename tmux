# ~/.tmux.conf
# ~/.byobu/.tmux.conf

# https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"

# hide the status bar
set -g status off

set-option -g focus-events on
