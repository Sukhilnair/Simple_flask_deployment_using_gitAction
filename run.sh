#!/bin/bash
sudo apt-get install screen -y
sudo kill -9 `ps aux | grep app.py | awk '{print $2}'`
SESSION_NAME="flask_app"
FLASK_COMMAND="python3 /home/ubuntu/flask-app/app.py"

if ! command -v tmux &> /dev/null
then
    echo "tmux could not be found, installing it..."
    sudo apt-get update
    sudo apt-get install tmux
fi
tmux new -d -s $SESSION_NAME $FLASK_COMMAND

if tmux ls | grep -q "$SESSION_NAME"; then
  echo "Flask app is running in a tmux session named $SESSION_NAME."
else
  echo "Failed to start Flask app in a tmux session."
fi