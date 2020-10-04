# ~/.tmux.conf
# ~/.byobu/.tmux.conf

# https://github.com/tmux/tmux/issues/1246#issuecomment-493454336
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",alacritty:RGB"

# hide the status bar
set -g status off
