#!/bin/bash

set -e

# Function to check if docker and docker compose plugin are installed
check_docker() {
    if command -v docker >/dev/null 2>&1; then
        if docker compose version >/dev/null 2>&1; then
            echo "✅ Docker and Docker Compose are already installed."
            return 0
        else
            echo "⚠️  Docker found, but no Compose plugin."
            return 1
        fi
    else
        echo "❌ Docker not found."
        return 1
    fi
}

# Only install if not present
if check_docker; then
    exit 0
fi

echo "🔧 Installing Docker CE with Docker Compose..."

# Remove old versions
sudo apt remove -y docker docker-engine docker.io containerd runc || true

# Update packages
sudo apt update
sudo apt install -y ca-certificates curl gnupg

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
fi

# Add Docker repository if not already present
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
      | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

# Install Docker CE + Docker Compose plugin
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker installation complete!"

# Optional: allow running without sudo
if groups $USER | grep -q '\bdocker\b'; then
    echo "👤 User already in docker
