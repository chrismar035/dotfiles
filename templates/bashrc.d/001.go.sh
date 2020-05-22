#/bin/bash

export PATH="$PATH:/usr/local/go/bin"
export GOPRIVATE=github.com/growthtools/*,github.com/codegoalie/disneyresorts
export GOPATH=~/go

alias gmtv='go mod tidy && go mod vendor'
alias gmt='go mod tidy'
