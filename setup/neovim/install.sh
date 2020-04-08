#/bin/bash

set -e

# VERSION=0.4.3
# wget https://github.com/neovim/neovim/releases/download/v$VERSION/nvim.appimage -o ~/bin/nvim
# chmod u+x ~/bin/nvim
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt update

brew install neovim
sudo apt install -y \
  # neovim \
  python-pip python3-pip
pip install pynvim
pip3 install pynvim
