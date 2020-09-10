# https://github.com/tmux/tmux/issues/1246#issuecomment-493454336
set -g default-terminal "xterm-256color"
set -ga terminal-overrides ",*256col*:Tc"
