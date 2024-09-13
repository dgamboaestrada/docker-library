# Tmux
alias tmuxa="tmux attach"
alias tmux-sync="tmux setw synchronize-panes on"
alias tmux-unsync="tmux setw synchronize-panes off"
alias tmux-split="tmux splitw && tmux resize-pane -D 8"
function tmux-renamew() {
  tmux rename-window $(current-dir)
}
function tmux-new-workspace() {
  tmux new -s ${PWD##*/} -d \; split-window -v \; resize-pane -D 8
  tmux attach
}
