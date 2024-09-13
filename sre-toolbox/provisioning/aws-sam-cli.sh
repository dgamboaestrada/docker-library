#!/bin/bash -xv
set -Eeuo pipefail
echo "Installing aws-sam-cli"
cd /tmp
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
./sam-installation/install
sam --version
rm -rf /tmp/aws-sam-cli-linux-x86_64.zip /tmp/sam-installation
