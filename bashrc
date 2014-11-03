source ~/.profile
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
ssh-add > /dev/null 2>&1

#aliases
alias splode='clear && /usr/local/bin/fortune -a | cowsay'

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

/usr/local/bin/fortune -a | cowsay -b

PS1="$GREEN\u@\h$NO_COLOR:\w$RED\$(parse_git_branch)$NO_COLOR\$ "
