source ~/.profile
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
ssh-add > /dev/null 2>&1

#Sets up environment variables for sql connectivity
export ORACLE_HOME=~/Configs/oracle/instantclient_11_2
export TNS_ADMIN=~/Configs/oracle
export DYLD_LIBRARY_PATH=~/Configs/oracle/instantclient_11_2

# Ensures that usr/local/bin is in the path, as well as adding $DYLD_LIB path for sqlpro and other sqly things.
export PATH=/usr/local/bin:$DYLD_LIBRARY_PATH:$PATH


#aliases
alias splode='clear && /usr/local/bin/fortune -a | cowsay -f stegosaurus'

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

/usr/local/bin/fortune -a | cowsay -f stegosaurus

PS1="$GREEN\u@\h$NO_COLOR:\w$RED\$(parse_git_branch)$NO_COLOR\$ "
