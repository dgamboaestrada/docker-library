# Description: Default settings for zsh
ZSH_THEME="avit"
plugins=(
  git
  sudo
  nvm
  fabric
)
export LANG=en_US.UTF-8
ZSH_DISABLE_COMPFIX="true"
# Auto complete
autoload -U +X bashcompinit && bashcompinit
