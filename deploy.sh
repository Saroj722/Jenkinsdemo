#!/bin/bash
set -e

echo "Deploying application..."
nohup python3 app.py > app.log 2>&1 &
echo "App is running in the background on port 5000"

