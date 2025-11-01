#!/bin/bash

set -e

# Check if python3.9 is installed
if command -v python3.9 >/dev/null 2>&1; then
    echo "✅ Python 3.9 is already installed: $(python3.9 --version)"
    exit 0
else
    echo "❌ Python 3.9 not found. Installing..."
fi

# Update package lists
sudo apt update

# Install prerequisites
sudo apt install -y software-properties-common

# Add deadsnakes PPA (contains newer Python versions)
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

# Install Python 3.9
sudo apt install -y python3.9 python3.9-venv python3.9-distutils

echo "✅ Installed Python: $(python3.9 --version)"
