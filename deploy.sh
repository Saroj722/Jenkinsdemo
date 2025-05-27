#!/bin/bash
echo "Deploying application..."

# Kill any previous app if it's running
fuser -k 5000/tcp || true

# Start the Flask app using nohup and log output/errors
nohup venv/bin/python3 app.py > app.log 2>&1 &

# Wait briefly to ensure app has time to start
sleep 3

# Print last few log lines to Jenkins
echo "App log:"
tail -n 10 app.log

# Check if process is listening on port 5000
echo "Processes on port 5000:"
sudo lsof -i :5000

