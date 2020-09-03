#/bin/bash

set -e

mkdir -p ~/bin
# wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy \
#   -O ~/bin/diff-so-fancy
# chmod +x ~/bin/diff-so-fancy
ln -s ~/.local/dotfiles/bin/delta-0.1.1 ~/bin/delta

ln -s ~/.local/dotfiles/templates/git/.gitconfig ~/.gitconfig
ln -s ~/.local/dotfiles/templates/git/.gitignore ~/.gitignore

ln -s ~/.local/dotfiles/bin/git-sweep ~/bin/git-sweep
ln -s ~/.local/dotfiles/bin/git-sweepm ~/bin/git-sweepm
ln -s ~/.local/dotfiles/bin/git-merged ~/bin/git-merged
