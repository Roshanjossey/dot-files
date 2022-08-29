# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red  
RPROMPT='%~ %F{red}${vcs_info_msg_0_}%f'

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

PROMPT=" %F{033}❯%f "
# RPROMPT="%F{red}${vcs_info_msg_0_}%f %~"

PATH="$HOME/.local/bin:$PATH"

# soure aliases
source ~/zsh/aliases.sh
source ~/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export HISTFILE=~/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# default workspace for Executors
export JINA_DEFAULT_WORKSPACE_BASE="${HOME}/.jina/executor-workspace"

# JINA_CLI_END











export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"













