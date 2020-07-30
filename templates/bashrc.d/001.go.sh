#/bin/bash

export PATH="$PATH:/usr/local/go/bin"
export GOPRIVATE=github.com/growthtools/*,github.com/codegoalie/disneyresorts
export GOPATH=~/go

alias gmt='go mod tidy'

# alias gmtv='go mod tidy && go mod vendor'
gmtv() {
  go mod tidy
  if [ -f vendor.sh ]; then
    echo "running ./vendor.sh"
    ./vendor.sh
  else
    go mod vendor
  fi
}
