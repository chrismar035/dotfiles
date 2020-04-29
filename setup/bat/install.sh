#/bin/sh

set -e

VERSION=0.15.0
FILENAME=bat_${VERSION}_amd64.deb

wget https://github.com/sharkdp/bat/releases/download/v$VERSION/$FILENAME
sudo dpkg -i $FILENAME
rm $FILENAME
