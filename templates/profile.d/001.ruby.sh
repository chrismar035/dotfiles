#/bin/bash


export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

# Use Homebrew's OpenSSL version; which is updated
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# without brew --prefix
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/home/linuxbrew/.linuxbrew/opt/openssl@1.1"

alias be='bundle exec'
alias brake='bundle exec rake'
alias brails='bundle exec rails'
