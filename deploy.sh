#!/bin/bash
echo "Deploying application..."

# Kill any old processes (optional safety)
fuser -k 5000/tcp || true

# Run the app in background using the virtual environment Python
nohup venv/bin/python3 app.py > app.log 2>&1 &

echo "App is running in the background on port 5000"

