#!/bin/bash -xv
# Install pyenv (https://github.com/pyenv/pyenv-installer)
set -Eeuo pipefail
echo "Installing pyenv"
curl https://pyenv.run | bash

# Load pyenv automatically by appending
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Install Python 2.7, 3.8, 3.9, 3.10, 3.11, 3.12
pyenv install 2.7
pyenv install 3.8
pyenv install 3.9
pyenv install 3.10
pyenv install 3.11
pyenv install 3.12
