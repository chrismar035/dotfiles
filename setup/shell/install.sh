#/bin/bash

set -e

sudo apt install -y silversearcher-ag

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
