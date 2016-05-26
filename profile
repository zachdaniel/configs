#!/bin/bash
if [ -f ~/Configs/machine_specific/profile ]; then
  source ~/Configs/machine_specific/profile
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH #add homebrew packages to the path
export PATH=/usr/local/opt/llvm/bin:$PATH #add llvm bindings to path
export PATH=~/Configs/scripts:$PATH #add scripts to path
export PATH=~/Configs/machine_specific/scripts:$PATH #add machine specific scripts to path
export EDITOR=vim

export CDPATH=.:~/Development
