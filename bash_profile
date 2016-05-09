#!/bin/bash

if [ -f ~/Configs/machine_specific/bash_profile ]; then
  source ~/Configs/machine_specific/bash_profile
fi

if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

