#/bin/bash

set -e

SOURCE=~/.local/dotfiles/templates/hyper.js
DEST=~/.hyper.js

if [ -f $DEST ]; then
  echo "$DEST exists. Moving to $DEST.backup"
  mv $DEST $DEST.backup
fi
ln -s $SOURCE $DEST
