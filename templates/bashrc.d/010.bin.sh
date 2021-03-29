#/bin/bash


export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

mcd ()
{
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}

cdp ()
{
  docker-compose stop &&
    j $1 &&
    ./start.sh
}
