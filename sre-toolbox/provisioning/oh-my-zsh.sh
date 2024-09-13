#!/bin/bash -xv
set -Eeuo pipefail
echo "Installing oh-my-zsh"
echo "y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh) root
