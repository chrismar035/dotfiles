#/bin/bash

set -e

PGCLI_CONFIG_PATH="$HOME/.config/pgcli/config"
if [ -f $PGCLI_CONFIG_PATH ]; then
  echo "$PGCLI_CONFIG_PATH exists. Moving to $PGCLI_CONFIG_PATH.backup"
  mv $PGCLI_CONFIG_PATH  $PGCLI_CONFIG_PATH.backup
fi
ln -s ~/.local/dotfiles/templates/pgcli-config $PGCLI_CONFIG_PATH
