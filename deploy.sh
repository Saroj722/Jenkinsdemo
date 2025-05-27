#!/bin/bash
echo "Deploying application..."

# Kill any previous process on port 5000
fuser -k 5000/tcp || true

# Start the Flask app in the background with logging
nohup venv/bin/python3 app.py > app.log 2>&1 &

# Give it a moment to start
sleep 3

# Show the last 10 lines of the log
echo "App log:"
tail -n 10 app.log

# Show processes listening on port 5000 (remove sudo)
echo "Processes on port 5000:"
lsof -i :5000 || echo "Could not check port (no sudo)"

