alias ssh-keygen="ssh-keygen -t rsa -b 4096"
function ssh_reset_color() {
  ssh $@;
  setterm --default --clear all;
}
alias ssh=ssh_reset_color

command -v nvim >/dev/null 2>&1 && alias vim=nvim

alias t=tmux
alias ta="tmux a"

alias emacs="emacsclient --create-frame"

alias riot-web="riot-web --proxy-server=socks5://127.0.0.1:9051"
