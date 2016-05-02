#!/bin/bash

##################
# Git Completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

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
alias f='open -a Finder ./'                # f:Opens current directory in MacOS Finder
alias ~="cd ~"                             # ~:            Go Home
alias c='clear'                            # c:            Clear terminal display
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

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
PURPLE="\e[0;35m"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $PURPLE
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  elif [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  fi
}

set_bash_prompt(){
    PS1="$GREEN\u@\h$NO_COLOR:\w$(git_color)$(parse_git_branch)\$$NO_COLOR \n ᗧ ○ ○ "
}

PROMPT_COMMAND=set_bash_prompt