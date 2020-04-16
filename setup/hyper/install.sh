#/bin/bash

set -e

wget https://releases.hyper.is/download/deb
sudo dpkg -i deb
rm deb
