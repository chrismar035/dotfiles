#/bin/bash

set -e

curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
run_keybase
rm ./keybase_amd64.deb
