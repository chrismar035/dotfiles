#/bin/sh

set -e

sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y obs-studio ffmpeg
