#!/bin/bash

cargo install \
    fd-find \
    ripgrep \
    bat

sudo apt install \
    ncdu \
    zsh \
    python3-pip

pip3 install --user \
    httpie \
    glances

curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin