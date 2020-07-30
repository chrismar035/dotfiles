#/bin/bash

set -e

mkdir -p ~/bin

ln -s ~/.local/dotfiles/templates/bashrc.d ~/.local/bashrc.d
ln -s ~/.local/dotfiles/templates/profile.d ~/.local/profile.d

if [ -f ~/.bashrc ]; then
  echo ".bashrc exists. Moving to ~/.bashrc.backup"
  mv ~/.bashrc  ~/.bashrc.backup
fi
ln -s ~/.local/dotfiles/templates/.bashrc ~/.bashrc

if [ -f ~/.zprofile ]; then
  echo ".zprofile exists. Moving to ~/.zprofile.backup"
  mv ~/.zprofile  ~/.zprofile.backup
fi
ln -s ~/.local/dotfiles/templates/.profile ~/.zprofile

ln -s ~/.local/dotfiles/templates/ripgreprc ~/.ripgreprc
