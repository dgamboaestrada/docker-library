# Git aliases and functions
alias gitco="git co"
alias gitstash="git stash"
alias gitstashp="git stash pop"
alias git-current-branch="git rev-parse --abbrev-ref HEAD"
alias gitrh1="git reset HEAD~1"
alias gitdel-remotebr="gitdel_remotebr"
alias gitdel-remotetag="gitdel_remotetag"
alias git-get-last_commit-message="git_get_last_commit_message"
function gitfetch() {
  git fetch origin
}
function gitpull() {
  git pull origin $(git_current_branch)
}
function gitpush() {
  git push origin $(git_current_branch)
}
function gitpushf() {
  git push origin $(git_current_branch) -f
}
function gitcommit() {
  echo "git commit -m \"$(git_current_branch): $1\""
  git commit -m "$(git_current_branch): $1"
}
function gitamend() {
  git commit --amend -m "$(git log -1 --pretty=%B)"
}
function gitrepush() {
  git commit --amend -m "$(git log -1 --pretty=%B)" && git push origin $(git_current_branch) -f
}
function gitdel_remotebr() {
  git push origin --delete $1
}
function gitdel_remotetag() {
  git push origin --delete $1

}
function git-last-commited-files() {
  git log -1 --stat --oneline --no-merges
}
function git_get_last_commit_message() {
  git log -n 1 --format="%s"
}
function git_get_remote_url() {
  git remote -v | grep fetch | cut -f 2 | cut -d " " -f 1
}
function git_get_project_name() {
  git remote -v | grep fetch | cut -f 2 | cut -d "/" -f 2 | cut -d "." -f 1
}
