# Misccellaneous
alias c="clear"
alias tailf="tail -f"
alias rmr="rm -rf"
alias grepH="grep -Hirn"
alias reload-zshrc="source ~/.zshrc"
alias edit-zshrc="vi ~/.zshrc"
alias edit-vimrc="vi ~/.vimrc"
alias edit-ssh-config="vi ~/.ssh/config"
alias edit-hosts="sudo vi /etc/hosts"
alias dg-ping="ping -c 1"
alias dg-checkip="curl https://checkip.amazonaws.com/"
alias dg-pwgen="pwgen -y 12"
alias dg-pwdcp="pwd | pbcopy"
alias dg-open-with-chrome="open -a 'Google Chrome'"
alias dg-current-dir="current_dir"

function dg_current_dir() {
  echo "${PWD##*/}"
# basename $PWD
}
function dg-get-unix-timestamps() {
  echo "$(date +%s)"
}
function dg-get-cpu-temperature() {
  sudo powermetrics --samplers smc |grep -i -A 1 "CPU die temperature"
}
function dg-get-http-status-code() {
  curl -sSI $1 | grep HTTP/1.1
}
function dg-get-https-status-code() {
  curl -sSI $1 | grep HTTP/2
}
function dg-check-http-status-code() {
  watch "curl -sSI $1 | grep HTTP/1.1 && date"
}
function dg-check-https-status-code() {
  watch "curl -sSI $1 | grep HTTP/2 && date"
}
function dg-is-http-status-code-200() {
  if [`curl -sSI $1 | grep 'HTTP/1.1 200' | wc -l` -ne 1 ]; then echo 1; return 1; fi
  echo 0
  return 0
}
function dg-basic-auth(){
  user=$1
  password=$2
  echo -n "$user:$password" | base64
}
# SSH keys switch function to switch between keys
function dg-sshkey-switch() {
  ls -1 ~/.ssh/*_id_rsa.pub | xargs -n 1 basename | cut -d "_" -f 1-1
  echo "Write the key name:"
  read key_name
  ssh-add -d ~/.ssh/id_rsa
  cp ~/.ssh/${key_name}_id_rsa ~/.ssh/id_rsa
  cp ~/.ssh/${key_name}_id_rsa.pub ~/.ssh/id_rsa.pub
  ssh-add ~/.ssh/id_rsa
}

# Vi
alias vi="vim"
function vi-open-modified-files() {
    vi $(gst | grep modified | cut -d " " -f 4)
}

#gcloud
alias gcloud-shell="gcloud cloud-shell ssh --authorize-session"

# 1Password
function op-login() {
  token_file="/tmp/op-token.txt"
  if [[ -f "$token_file" ]]; then
      echo "Loading existing token."
      op list users
      if [ $? -ne 0 ]; then
          op signin my > /tmp/op-token.txt
      fi
  else
      op signin my > /tmp/op-token.txt
  fi
  eval $(cat /tmp/op-token.txt)
}
