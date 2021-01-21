#/bin/bash

set -e

# VERSION=0.4.3
# wget https://github.com/neovim/neovim/releases/download/v$VERSION/nvim.appimage -o ~/bin/nvim
# or https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
# chmod u+x ~/bin/nvim
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt update
# sudo apt intall neovim

brew install neovim
sudo apt install -y \
  python-pip python3-pip
pip install pynvim
pip3 install pynvim
