#!/bin/bash

if [ -f ~/Configs/machine_specific/bashrc ]; then
  source ~/Configs/machine_specific/bashrc
fi

##################
# Git Completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


################
# Git Config
git config --global user.name zachdaniel
git config --global user.email zachary.s.daniel@gmail.com
git config --global push.default current

##############
# Aliases

alias cp='cp -i'                           # Preferred 'cp' implementation
alias mv='mv -i'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                    # Preferred 'mkdir' implementation
alias ls='ls -AFGp'                        # Preferred 'ls' implementation
alias less='less -Fc'                      # Preferred 'less' implementation
cdd() { builtin cd "$@"; ls;  }            # 'cdd' can be used to cd and ls
alias cd..='cd ../'                        # Go back 1 directory level (for fast typers)
alias ..='cd ../'                          # Go back 1 directory level
alias ...='cd ../../'                      # Go back 2 directory levels
alias .3='cd ../../../'                    # Go back 3 directory levels
alias .4='cd ../../../../'                 # Go back 4 directory levels
alias .5='cd ../../../../../'              # Go back 5 directory levels
alias .6='cd ../../../../../../'           # Go back 6 directory levels
alias ~="cd ~"                             # ~:            Go Home
alias dev="cd ~/Development"
alias watch='watch ' # This allows for the commands after watch to be aliases
mcd () { mkdir -p "$1" && cd "$1"; }       # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }    # trash:        Moves a file to the MacOS trash

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------

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

#   Number conversions
#   ---------------------------------------

from_hex() {
  echo "$((0x$1))"
}

to_hex() {
  printf '%x\n' "$1"
}

from_binary() {
  echo "$((2#$1))"
}

to_binary() {
  ruby -e "puts $1.to_s(2)"
}

#################
# PS1

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_PURPLE
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  elif [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  fi
}

set_bash_prompt(){

    PS1="\[\w\] \[$(git_color)\]$(parse_git_branch)\[${COLOR_NC}\]\n\[${COLOR_PURPLE}\]λ\[${COLOR_NC}\]: "
}

function from_epoch () {
  i=$1
  size=${#i}
  if ((size == 13)); then
    i=$(($i / 1000))
  fi
  date -r $i
}

function fuckport() {
    kill `sudo lsof -t -i:$1`
}


PROMPT_COMMAND=set_bash_prompt
