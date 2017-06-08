# Path to your oh-my-zsh installation.
export ZSH=/Users/rjossey/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# souce my famous aliases
source $ZSH/aliases.sh
source $ZSH/themes.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="/Users/rjossey/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(rbenv init -)"
