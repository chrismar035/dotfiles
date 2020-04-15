#/bin/bash

set -e

mkdir -p ~/.config/alacritty
if [ -f ~/.config/alacritty/alacritty.yml ]; then
  echo "~/.config/alacritty/alacritty.yml exists. Moving to ~/.config/alacritty/alacritty.yml.backup"
  mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.backup
fi
ln -s ~/.local/dotfiles/templates/alacritty.yml ~/.config/alacritty/alacritty.yml
