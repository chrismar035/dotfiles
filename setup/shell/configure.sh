#/bin/bash

set -e

ln -s ~/.local/dotfiles/templates/bashrc.d ~/.local/bashrc.d
ln -s ~/.local/dotfiles/templates/profile.d ~/.local/profile.d

if [ -f ~/.bashrc ]; then
  echo ".bashrc exists. Moving to ~/.bashrc.backup"
  mv ~/.bashrc  ~/.bashrc.backup
fi
ln -s ~/.local/dotfiles/templates/.bashrc ~/.bashrc

if [ -f ~/.profile ]; then
  echo ".profile exists. Moving to ~/.profile.backup"
  mv ~/.profile  ~/.profile.backup
fi
ln -s ~/.local/dotfiles/templates/.profile ~/.profile
