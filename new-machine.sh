#/bin/bash

set -e

# Packages
sudo apt-get install -y \
  python3 python3-dev \
  python python-dev

#git
./setup/git/configure.sh

# ssh-keys and github
# ./setup/github/configure.sh

# Oh my Zsh
./setup/oh-my-zsh/install.sh
./setup/oh-my-zsh/configure.sh

# Shell settings
./setup/shell/install.sh
./setup/shell/configure.sh

# homebrew
./setup/homebrew/install.sh

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

# Go
./setup/go/install.sh 1.14.1

# autojump
./setup/autojump/install.sh

# gcloud
./setup/gcloud/install.sh

# kubectrl
./setup/kubectl/install.sh

# Docker
# Postgresql-client
# peek - gif recording
# flameshot
# copyq
# OBS
# Zoom
# alacritty
# Firefox
# Firefox dev
