#!/bin/bash

if [ -f ~/Configs/machine_specific/bash_profile ]; then
  source ~/Configs/machine_specific/bash_profile
fi

if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi


# The next line updates PATH for the Google Cloud SDK.
source '/Users/zacharydaniel/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/zacharydaniel/google-cloud-sdk/completion.bash.inc'
