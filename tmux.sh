#!/bin/bash

# start a new session
tmux new-session -d -s scouts -n editor
tmux new-window -t scouts:2 -n server
tmux new-window -t scouts:3 -n console

# Execute commands
tmux send-keys -t scouts:1 'vim' enter
tmux send-keys -t scouts:2 'rails server -b 0.0.0.0 -p 3001' enter

tmux attach -t scouts
