#/bin/bash


export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

# Use Homebrew's OpenSSL version; which is updated
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

