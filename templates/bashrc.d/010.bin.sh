#/bin/bash


export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

mcd ()
{
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}

chproj ()
{
  docker-compose stop &&
    j $1 &&
    ./start.sh
}
