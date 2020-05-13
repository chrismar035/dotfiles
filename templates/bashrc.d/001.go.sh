#/bin/bash

export PATH="$PATH:/usr/local/go/bin"
export GOPRIVATE=github.com/growthtools/*,github.com/codegoalie/disneyresorts

alias gmtv='go mod tidy && go mod vendor'
