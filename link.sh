#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

safe_link () {
    # Makes a backup of the destination file, if it was no link
    if [[ -L $2 ]]; then
        ln -sfv ${BASEDIR}/$1 $2
    else
        ln -sfvb ${BASEDIR}/$1 $2
    fi
}


safe_link zshrc ~/.zshrc
safe_link vimrc ~/.vimrc
safe_link gitconfig ~/.gitconfig
safe_link gitignore ~/.gitignore
safe_link tmux.conf ~/.tmux.conf

if hash nvim 2>/dev/null; then
  mkdir -p ~/.config/nvim
  safe_link vimrc ~/.config/nvim/init.vim
fi
