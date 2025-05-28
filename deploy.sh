#!/bin/bash

echo "Deploying application..."

# Kill any existing Flask app processes
pkill -f app.py || true

# Start Flask app with full path, nohup, and log redirection
LOG_FILE="app.log"
APP_CMD="./venv/bin/python3 app.py"

# Run app in background
nohup $APP_CMD > "$LOG_FILE" 2>&1 &

# Disown to detach from shell
disown

# Wait a few seconds and check if it started
sleep 3
if pgrep -f "$APP_CMD" > /dev/null; then
    echo "✅ App is running in the background on port 5000"
else
    echo "❌ App failed to start. Check $LOG_FILE for details."
    exit 1
fi
