#/bin/bash

set -e

VERSION=1.9.2
FILENAME=gopass_${VERSION}_linux_amd64.deb

sudo apt-get install -y gnupg2 rng-tools

wget https://github.com/gopasspw/gopass/releases/download/v$VERSION/$FILENAME
sudo dpkg -i $FILENAME
rm $FILENAME
