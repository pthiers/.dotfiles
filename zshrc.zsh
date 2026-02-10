if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -d "${HOME}/.config/composer/vendor/bin" ]] then
    export PATH=$PATH:${HOME}/.config/composer/vendor/bin
fi

# Setear home de ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
#Descargar si no existe zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Levantar zinit
source "${ZINIT_HOME}/zinit.zsh"
source "${HOME}/.dotfiles/alias.zsh"

#Si existe, cargamos las config de riskamerica
[[ -s "${HOME}/.dotfiles/riskamerica.zsh" ]] && source "${HOME}/.dotfiles/riskamerica.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light empresslabs/laravel.plugin.zsh
zinit light zsh-users/zsh-history-substring-search
#zinit ice wait atload'_history_substring_search_config'
# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
zinit snippet OMZP::gcloud

zinit snippet OMZP::kubectl

zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/oh-my-posh.toml)"

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON_SITEPACKAGES=1

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

export PATH=$PATH:"$HOME/.local/bin"

pod_xlsx_cp () {
  local pod="$1"

  kubectl exec "$pod" -- sh -c '
    ls /tmp/*.xlsx 2>/dev/null | xargs -n1 basename
  ' | xargs kubectl exec "$pod" -- \
    tar czf - -C /tmp \
  | tar xzf -
}




# FIX GHOSTTY
export TERM=xterm-256color

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Golang version manager
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
