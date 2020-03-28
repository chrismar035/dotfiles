#/bin/bash

set -e

wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy \
  -O ~/bin/diff-so-fancy
chmod +x ~/bin/diff-so-fancy

ln -s ~/.local/dotfiles/templates/git/.gitconfig ~/.gitconfig
ln -s ~/.local/dotfiles/templates/git/.gitignore ~/.gitignore
