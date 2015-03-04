tmux new-session -d 'newgrp docker'
tmux split-window -h 'newgrp docker'
tmux resize-pane -R 45 
tmux split-window -v 'newgrp docker'
tmux split-window -v 'htop'
tmux -2 attach-session -d 
