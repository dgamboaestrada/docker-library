#!/bin/bash -xv
set -Eeuo pipefail
echo "Installing ansible"

# Load pyenv automatically by appending
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv global 2.7
python -m pip install --user 'ansible==2.9.27'
