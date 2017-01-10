#!/bin/bash

if [ -f ~/Configs/machine_specific/bash_profile ]; then
  source ~/Configs/machine_specific/bash_profile
fi

if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export POSTGRES_SERVICE_HOST=localhost
export POSTGRES_SERVICE_PORT=5432
export POSTGRES_DATABASE=mandark_local
export POSTGRES_USERNAME=admin
export POSTGRES_PASSWORD=password
export MANDARK_SERVICE_HOST=localhost
export MANDARK_SERVICE_PORT=4001
export RETHINKDB_SERVICE_HOST=localhost
export RETHINKDB_SERVICE_PORT=28015
export RETHINKDB_DATABASE=local
export RETHINKDB_INCLUDE_INITIAL=false

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
