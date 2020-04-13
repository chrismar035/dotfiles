#/bin/bash

set -e

# Packages
sudo apt-get install -y \
  python3 python3-dev \
  python python-dev \
  curl

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
./setup/node/install.sh

# NeoVIM
./setup/neovim/install.sh
./setup/neovim/configure.sh

# wget
./setup/wget/install.sh

# Go
./setup/go/install.sh 1.14.2

# gopass
./setup/gopass/install.sh
# NOTE: keybase private folder has the gopass keys
# Also note: I don't know how to get browserpass working again
./setup/browserpass/install.sh

# autojump
./setup/autojump/install.sh

# gcloud
./setup/gcloud/install.sh

# kubectrl
./setup/kubectl/install.sh

# rust
./setup/rust/install.sh

# alacritty
./setup/alacritty/install.sh

# Docker (podman) / compose
./setup/docker/install.sh

# Postgresql-client
# peek - gif recording
# flameshot
# copyq
# OBS
# Zoom
# Firefox
# Firefox dev
