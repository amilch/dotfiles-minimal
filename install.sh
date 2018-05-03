#!/bin/bash

set -e

sudo add-apt-repository -y ppa:neovim-ppa/stable
# sudo apt-get update

sudo apt install -y neovim
sudo apt install -y git
sudo apt install -y python3
sudo apt install -y python
sudo apt install -y httpie

if ! [ -x "$(command -v n)" ]; then
  curl -L https://git.io/n-install | bash -s -- -y
  set -i
  . ~/.bashrc
  set +i
  n lts
fi

npm install -g gulp-cli
npm install -g bower

