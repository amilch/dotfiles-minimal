#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

safe_link () {
    # Makes a backup of the destination file, if it was no link
    if [[ -L $2 ]]; then
        ln -sfv ${BASEDIR}/$1 $2
    else
        ln -sfvb ${BASEDIR}/$1 $2
    fi
}


safe_link bashrc ~/.bashrc
safe_link bash_aliases ~/.bash_aliases
safe_link vimrc ~/.vimrc
safe_link gitconfig ~/.gitconfig
safe_link gitignore ~/.gitignore

cd "${BASEDIR}"
git init
git remote add origin git@github.com:andreasmilch/dotfiles-minimal.git

# tmux
# safe_link ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf
