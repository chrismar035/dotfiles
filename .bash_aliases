alias la='ls -a'
alias lla='ll -a'
alias make='make -j4'

alias g='nocorrect git'
alias gp='git push'
alias gl='git pull'

alias agi='sudo apt-get install -y'
alias acs='apt-cache search'
alias agu='sudo apt-get update'

alias r='rails'
alias b='bundle exec'
alias be='bundle exec'
alias brake='bundle exec rake'
alias br='bundle exec rake'
alias cucumber='cucumber'
alias gind='gem install --no-rdoc --no-ri'
alias gi='gem install'
alias rr='rbenv rehash'
alias rubopr='g diff master --name-only | grep -v schema | xargs rubocop'

alias lsc="tmuxifier w server-core"

alias mmv="noglob zmv -W"

alias sw='cd ~/Dropbox/soy_wiki; soywiki'

alias gow='cd ~/workspace/go/src/github.com/chrismar035'
alias gol='cd ~/workspace/go/src/gitlab.com/codegoalie'

# Add an "alert" alias for long running commands. Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || \
             echo error)" "$(history|tail -n1| \
             sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# which commands I use requently
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | \
            head -n 30'

# recursively list dirs
alias lr='ls -R | grep ":$" | \
  sed -e '\''s/:$//'\'' -e \
  '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

# Docker stuff
alias de='eval "$(docker-machine env dinghy)"'
alias dc='docker-compose'
alias dcr='docker-compose run'
alias cleanup_docker='docker rm $(docker ps -a -q); docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias drails='docker-compose run web rails'
alias drake='docker-compose run web rake'
alias drspec='docker-compose run web rspec'

# extract most known types of archives
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
 
# create and move to a new dir
function mcd() {
  mkdir -p "$1" && cd "$1";
}
