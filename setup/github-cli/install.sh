#/bin/sh

set -e

VERSION=0.8.0
FILENAME=gh_${VERSION}_linux_amd64.deb

wget https://github.com/cli/cli/releases/download/v$VERSION/$FILENAME
sudo dpkg -i $FILENAME
rm $FILENAME
