#/bin/bash

set -e

# git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# echo "Trying to compile dynamic bash extension for rbenv. It's ok of this fails."
# cd ~/.rbenv && src/configure && make -C src

# ~/.rbenv/bin/rbenv init

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
