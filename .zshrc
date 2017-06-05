# Path to your oh-my-zsh installation.
export ZSH=/Users/roshanjossey/.oh-my-zsh

# zsh supporting all colors
export TERM=xterm-256color
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rvm vcs  time)
POWERLEVEL9K_DIR_FOREGROUND='white'
# Advanced `vcs` color customization
POWERLEVEL9K_VCS_FOREGROUND='black'
POWERLEVEL9K_VCS_DARK_FOREGROUND='black'
POWERLEVEL9K_VCS_BACKGROUND='green'
# If VCS changes are detected:
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='cyan'

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='123'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='123'
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true

plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
# google sheets, dashing environment variables

rvm use 2.2.3

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# grep recursive 
alias grep='grep -inr'
# remove folder force
alias rmf='rm -rf'
#tmux alias
alias tmux='tmux -u'
# git
alias ga='git add'
alias gap='git add -p'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash -p'
# alias gaa='git add -A'
alias gpr='git pull --rebase'
alias gp='git push'
alias gpom='git push origin master'
alias gd='git diff'
alias gc='git commit'

# Bundler
alias b="bundle"
alias be="bundle exec"

humour_me(){
  fortune | cowsay -f dragon
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/roshanjossey/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# If you installed the SDK via Homebrew, otherwise ~/Library/Android/sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
