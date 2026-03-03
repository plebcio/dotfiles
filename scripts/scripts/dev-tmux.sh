#!/bin/bash

SESSION="work-session"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # 1. Create the session and name the first window
  tmux new-session -d -s $SESSION -n 'neovim'

  tmux send-keys -t $SESSION:neovim "cd ~/work && source /home/iwarszawski/work/.venv/bin/activate.fish && nvim ." C-m

  # 2. Split the window. 
  # We use -h to split horizontally (left/right).
  tmux split-window -b -h -t $SESSION:neovim -l 5

  # 3. Send commands to the panes
  # Left pane (0)
  tmux send-keys -t $SESSION:neovim.0 "cd ~/work" C-m
  

  # 4. Create second window (k9s)
  tmux new-window -t $SESSION -n 'k9s'
  tmux send-keys -t $SESSION:k9s "k9s" C-m

  # 5. Create third window
  tmux new-window -t $SESSION -n 'misc'

  # Go back to the first window
  tmux select-window -t $SESSION:neovim
fi

tmux attach-session -t $SESSION
