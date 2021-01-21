#/bin/bash

set -e

wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv nvim.appimage ~/bin/
chmod +x ~/bin/nvim.appimage
nvim --version
