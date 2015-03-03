#!/bin/bash
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install git bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
