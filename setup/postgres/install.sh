#/bin/bash

set -e

# postgres 9.6 (for GT stuff)
sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y \
  postgresql-9.6 \
  postgresql-client-11 \
  libpq-dev

# Don't run postgres by default
sudo systemctl disable postgresql
sudo systemctl stop postgresql


# pycli
python3 -m pip install --user pipx
pipx install pgcli
