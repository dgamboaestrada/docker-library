#!/bin/bash -xv
set -Eeuo pipefail
echo "Installing misc stuff"

echo "Setting up python 3.8.0 with pyenv"
# Load pyenv automatically by appending
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv global 3.8

echo "Installing vim-handsome"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dgamboaestrada/vim-handsome/master/install.sh)"
