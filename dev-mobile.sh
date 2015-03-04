tmux new-session -d
tmux split-window -h
tmux resize-pane -R 45 
tmux split-window -v 'htop'
tmux resize-pane -D 20 
tmux -2 attach-session -d 
