#/bin/bash

set -e

# Packages
sudo apt-get install -y \
  python3 python3-dev \
  python python-dev

#git
./setup/git/configure.sh

# Oh my Zsh
./setup/oh-my-zsh/install.sh
./setup/oh-my-zsh/configure.sh

# Shell settings
./setup/shell/configure.sh

# ssh-keys and github
./setup/github/configure.sh

# Keybase
./setup/keybase/install.sh

# tmux
./setup/tmux/install.sh
./setup/tmux/configure.sh

# Ruby (via rbenv)
./setup/ruby/install.sh

# Node (via nvm)

# NeoVIM
./setup/neovim/install.sh
./setup/neovim/configure.sh

# wget
./setup/wget/install.sh

# gopass
./setup/gopass/install.sh
# NOTE: keybase private folder has the gopass keys
# Also note: I don't know how to get browserpass working again
./setup/browserpass/install.sh

# Docker
# Go
# Postgresql-client
# gcloud 
./setup/gcloud/install.sh

# autojump
./setup/autojump/install.sh

# peek - gif recording
# flameshot
# copyq
# keybase
# OBS
# Zoom
# alacritty
# Firefox
# Firefox dev
# kubectrl
