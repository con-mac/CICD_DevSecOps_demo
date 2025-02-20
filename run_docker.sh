#!/bin/bash
set -e  # Exit immediately if any command fails

echo "🚀 Building Docker Image..."
docker build -t devsecops-nginx .

echo "🛠 Stopping any running containers..."
docker stop $(docker ps -q) 2>/dev/null || true  # Prevents errors if no containers are running

echo "🧹 Removing old containers..."
docker rm $(docker ps -aq) 2>/dev/null || true  # Prevents errors if no containers exist

echo "🚀 Running the Container..."
docker run -d -p 8080:80 devsecops-nginx

echo "🔍 Checking Running Containers..."
docker ps

echo "🖥️ Checking if Web Page is Accessible..."
curl -I http://localhost:8080

