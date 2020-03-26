#/bin/bash

set -e

VERSION=1.8.6
FILENAME=gopass-$VERSION-linux-amd64.deb

sudo apt-get install -y gnupg2 rng-tools

wget https://github.com/gopasspw/gopass/releases/download/v$VERSION/$FILENAME
sudo dpkg -i $FILENAME
rm $FILENAME
