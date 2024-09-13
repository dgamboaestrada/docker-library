#!/bin/bash -xv
# Install Translate-shell / https://github.com/soimort/translate-shell
set -Eeuo pipefail
echo "Installing Translate-shell"
wget git.io/trans
chmod +x trans
mv trans /usr/bin/

