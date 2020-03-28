#/bin/bash

set -e

if [ -f ~/.zshrc ]; then
  echo ".zshrc exists. Moving to ~/.zshrc.backup"
  mv ~/.zshrc  ~/.zshrc.backup
fi
ln -s ~/.local/dotfiles/templates/oh-my-zsh/.zshrc ~/.zshrc
