#/bin/bash

set -e

RUBY_VERSION=2.7.1

# git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# echo "Trying to compile dynamic bash extension for rbenv. It's ok of this fails."
# cd ~/.rbenv && src/configure && make -C src

# ~/.rbenv/bin/rbenv init

# mkdir -p "$(rbenv root)"/plugins
# git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

brew install rbenv
rbenv install $RUBY_VERSION
# If the above fails with a complaint about openssl, try this:
# CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl` rbenv install $RUBY_VERSION
