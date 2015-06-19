export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.tmuxifier/bin:$PATH"

if [[ -n "$TMUX" || -n "$SSH_CLIENT" || -n "$ZSHRC_FORCE" ]]; then
  # A convenience function I'll be using a lot
  function source_if_exists() {
    [[ -f "$1" ]] && source "$1"
  }

  # Path to your oh-my-zsh configuration.
  export ZSH=$HOME/.oh-my-zsh

  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  # Optionally, if you set this to "random", it'll load a random theme each
  # time that oh-my-zsh is loaded.
  export ZSH_THEME="clean"

  # Set to this to use case-sensitive completion
  export CASE_SENSITIVE="true"

  # Comment this out to disable weekly auto-update checks
  # export DISABLE_AUTO_UPDATE="true"

  # Uncomment following line if you want to disable colors in ls
  # export DISABLE_LS_COLORS="true"

  # Uncomment following line if you want to disable autosetting terminal title.
  # export DISABLE_AUTO_TITLE="true"

  # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
  # Example format: plugins=(rails git textmate ruby lighthouse)
  plugins=(git ruby rails rake rbenv bundle heroku dircycle syntax-highlighting autojump gem history-substring-search)

  source $ZSH/oh-my-zsh.sh

  # COMPLETION SETTINGS
  # add custom completion scripts
  fpath=(~/.zsh/completion $fpath)

  # compsys initialization
  autoload -U compinit
  compinit

  # show completion menu when number of options is at least 2
  zstyle ':completion:*' menu select=2

  # environment stuff
  source_if_exists $HOME/.zshenv

  #alias stuff
  source_if_exists $HOME/.bash_aliases
  source_if_exists $HOME/.bash_aliases_local

  export EDITOR='vim'

  #bindkey -v
  bindkey "\e[1~" beginning-of-line # Home
  bindkey "\e[4~" end-of-line # End
  bindkey "\e[5~" beginning-of-history # PageUp
  bindkey "\e[6~" end-of-history # PageDown
  bindkey "\e[2~" quoted-insert # Ins
  bindkey "\e[3~" delete-char # Del

  # happy time vim normal mode
  bindkey -M viins 'kj' vi-cmd-mode
  # bind UP and DOWN arrow keys
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

  #eval $(dircolors -b $HOME/Dropbox/configs/LS_COLORS/LS_COLORS )

  uname=`uname`

  if [[ "$uname" = "Linux" ]]; then
    export ANDROID_HOME=$HOME/android-sdk-linux/sdk

  elif [[ "$uname" = "Darwin" ]]; then
    export ANDROID_HOME=$HOME/adt-bundle-mac-x86_64/sdk
  fi
  export PATH=$ANDROID_HOME/platform-tools:$PATH
  export PATH=$ANDROID_HOME/tools:$PATH


  export PERL_LOCAL_LIB_ROOT="/home/chrismar035/perl5";
  export PERL_MB_OPT="--install_base /home/chrismar035/perl5";
  export PERL_MM_OPT="INSTALL_BASE=/home/chrismar035/perl5";
  export PERL5LIB="/home/chrismar035/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/chrismar035/perl5/lib/perl5";
  export PATH="/home/chrismar035/perl5/bin:$PATH";

  # add custom shell scripts
  export PATH="$HOME/Dropbox/configs/pengwynn-dotfiles/bin:$PATH";

  # go workspace
  export GOPATH=$HOME/workspace/go
  export GOROOT=$HOME/workspace/sources/go
  export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

  # scala workspace
  export SCALA_HOME=$HOME/workspace/sources/scala
  export PATH=$PATH:$SCALA_HOME/bin

  # add local zshrc
  source_if_exists $HOME/.zshrc_local

  # use tmux with ssh
  function ssht(){
    ssh $* -t 'tmux a || tmux || /bin/bash'
  }

  #can overwrite settings here with a .zshrc.local
  source_if_exists $HOME/.zshrc.local
  export PATH=$HOME/bin:$PATH
else
  TMUX_ACT=$(tmux -S /tmp/tmux-tmux ls -F '#{session_windows}' 2> /dev/null)
  if [[ -z "$TMUX_ACT" || "$TMUX_ACT" = "0" ]]; then
    exec tmux -2 -S /tmp/tmux-tmux new -s tmux

  else
    TMUX_ATT=$(tmux -S /tmp/tmux-tmux ls -F '#{session_attached}' 2> /dev/null)
    if [[ -z "$TMUX_ATT" || "$TMUX_ATT" = "0" ]]; then
      exec tmux -2 -S /tmp/tmux-tmux att -t tmux
    else
      TMUX_RSP=
      vared -p 'Attach to active tmux session [nyc]? ' TMUX_RSP
      if [[ "$TMUX_RSP" = "y" || "$TMUX_RSP" = "Y" ]]; then
        exec tmux -2 -S /tmp/tmux-tmux att -t tmux
      elif [[ "$TMUX_RSP" = "c" || "$TMUX_RSP" = "C" ]]; then
        exec tmux -2 -S /tmp/tmux-tmux new -t tmux
      else
        export ZSHRC_FORCE=1
        source ~/.zshrc
      fi
    fi
  fi
fi

eval "$(tmuxifier init -)"
[[ -a "/tmp/tmux-tmux" ]] && chmod 1777 /tmp/tmux-tmux

# added by travis gem
[ -f /Users/chrismar035/.travis/travis.sh ] && source /Users/chrismar035/.travis/travis.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
