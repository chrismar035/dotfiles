#/bin/bash

set -e

cargo install cargo-deb
sudo apt install -y \
  cmake \
  pkg-config \
  libfreetype6 \
  libfreetype6-dev \
  libfontconfig1-dev \
  libxcb-xfixes0-dev \
  python3 \
  xclip

mkdir -p ~/sources/
# git clone git@github.com:alacritty/alacritty.git ~/sources/alacritty
cd ~/sources/alacritty
git pull
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
cargo deb --install -p alacritty

# Add desktop entry for system menus
sudo cp target/release/alacritty ~/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Set default terminal
update-alternatives --config x-terminal-emulator

cd -
