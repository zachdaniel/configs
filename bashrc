source ~/.profile
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
ssh-add > /dev/null 2>&1
export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
