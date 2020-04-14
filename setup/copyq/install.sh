#/bin/bash

set -e

sudo apt install software-properties-common
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install -y copyq
