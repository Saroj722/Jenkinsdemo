#!/bin/bash
set -e

echo "Cleaning old virtual environment..."
rm -rf venv

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Upgrading pip..."
./venv/bin/pip install --upgrade pip

echo "Installing dependencies..."
./venv/bin/pip install -r requirements.txt

echo "Running tests..."
./venv/bin/python3 -m pytest test_app.py
