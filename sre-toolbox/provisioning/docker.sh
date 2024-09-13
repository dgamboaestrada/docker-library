#!/bin/bash -xv
set -Eeuo pipefail
echo "Installing docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh

echo "Installing docker-compose"
apt-get install -y docker-compose
