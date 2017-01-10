#!/bin/bash
if [ -f ~/Configs/machine_specific/profile ]; then
  source ~/Configs/machine_specific/profile
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH #add homebrew packages to the path
export PATH=/usr/local/opt/llvm/bin:$PATH #add llvm bindings to path
export PATH=~/Configs/scripts:$PATH #add scripts to path
export PATH=~/Library/Haskell/bin/:$PATH
export PATH=~/Configs/machine_specific/scripts:$PATH #add machine specific scripts to path
export PATH=~/.multirust/toolchains/nightly/cargo/bin:$PATH #add multirust binaries to path
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export EDITOR=vim
export CDPATH=.:~/Development
export POSTGRES_SERVICE_HOST=localhost
export POSTGRES_SERVICE_PORT=5432
export POSTGRES_DATABASE=mandark_local
export POSTGRES_USERNAME=admin
export POSTGRES_PASSWORD=password
export MANDARK_SERVICE_HOST=localhost
export MANDARK_SERVICE_PORT=4001
export RETHINKDB_1_SERVICE_HOST=localhost
export RETHINKDB_1_SERVICE_PORT=28015
export RETHINKDB_DATABASE=local
export RETHINKDB_INCLUDE_INITIAL=false

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
