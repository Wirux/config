# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#set language
export LANG=en_US.UTF-8

source "$(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## ZSH PLUGINS
plugins=( 
	git
  terraform
)

source /Users/adamwilczek/.docker/init-zsh.sh || true # Added by Docker Desktop
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH autosyntax
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
# autoload -U compinit; compinit
source ~/.zsh/autocompletion_addons/az.completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform
source <(kubectl completion zsh)
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
setopt complete_aliases

#--
# zstyle ':autocomplete:*history*:*' insert-unambiguous yes
# Set fzf history sorter
# zstyle ':completion:*' menu select=2
#
# # Use history for completion
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/cache
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*:default' menu select=1
# zstyle ':completion:*' sort true

# Ensure zsh-autosuggestions uses history strategy
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#--
## APPLICATIONS
# init zoxide (cd->z)
eval "$(zoxide init zsh)"

# init fzf 
source <(fzf --zsh)

# Load Angular CLI autocompletion.
# source <(ng completion script)

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# find file and run nvim on it
fnv() {
  local find="$1"
    fd --hidden --exclude .git  "$find" | fzf | xargs nvim
}

## BINDINGS
# autosuggest
bindkey 'ą' autosuggest-accept
bindkey '^I'   complete-word 
bindkey '^I^I' autosuggest-accept
# vim motion in shell
# bindkey -v

## ALIASES
# ls to lds
alias ls="lsd"
alias l="ls -lah"
alias ll="ls -la"
alias tree="lsd --tree"
# git
alias gs="git status"
alias gc="git commit -a -m"
alias gp="git push"
# rest
alias nv="nvim"
alias cat="bat"
alias cd="z"
alias k="kubectl"
## DIRs
export REPO="$HOME/Documents/repos"
#
# compdef k='kubectl'
# compdef cd='z'
