[[ -r ~/.bashrc ]] && . ~/.bashrc
[[ -r ~/.profile ]] && . ~/.profile
#aliases
alias splode='clear && /usr/local/bin/fortune -a | cowsay -f stegosaurus'

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
PURPLE="\e[0;35m"

/usr/local/bin/fortune -a | cowsay -f stegosaurus

PS1="$GREEN\u@\h$NO_COLOR:\w$RED\$(parse_git_branch)$PURPLE\$$NO_COLOR \n ᗧ ○ ○ "
