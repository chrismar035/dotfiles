#/bin/bash

set -e

VERSION=3.0.6
OS=linux64
FILENAME=browserpass-$OS-$VERSION.tar.gz
TMP=/tmp/browserpass/

curl https://keybase.io/maximbaz/pgp_keys.asc | gpg --import

mkdir -p ~/sources
cd ~/sources
if [ -f browserpass-native ]; then
  echo "browserpass-native repo already cloned"
else
  git clone git@github.com:browserpass/browserpass-native.git
fi
cd browserpass-native
git pull
make browserpass
