#!/bin/bash

set -e

if [ -z "$1" ]
then
  echo "Please provide a version number, like 1.13.5"
  exit 1
fi

FILENAME=go$1.$(uname | tr '[:upper:]' '[:lower:]')-amd64.tar.gz
URL=https://dl.google.com/go/$FILENAME

wget $URL
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $FILENAME
rm $FILENAME
go version
