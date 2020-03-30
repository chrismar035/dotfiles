#/bin/bash

set -e

mkdir -p ~/.config/
ln -s ~/.local/dotfiles/templates/neovim ~/.config/nvim

vim -c 'PlugInstall|q'
vim -c 'CocInstall -sync coc-json coc-html coc-css coc-cssmodules coc-eslint coc-go coc-markdownlint coc-yank|q'

