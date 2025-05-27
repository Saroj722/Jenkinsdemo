#!/bin/bash

echo "Deploying application..."

# Kill previous app (optional cleanup)
pkill -f app.py || true

# Start Flask app in background using nohup and disown
nohup ./venv/bin/python3 app.py > app.log 2>&1 &
disown

echo "App is running in the background on port 5000"

