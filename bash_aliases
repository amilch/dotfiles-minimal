alias ssh-keygen="ssh-keygen -t rsa -b 4096"

command -v nvim >/dev/null 2>&1 && alias vim=nvim

alias start-ssh-agent="ssh-agent bash -c \"ssh-add -k; bash -i\""
