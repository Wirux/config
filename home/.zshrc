# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Set language
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

## ZSH AUTOSUGGEST TOOLS
# Init
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#config
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
setopt complete_aliases

# load compinit
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# Addons
source ~/.zsh/autocompletion_addons/az.completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform
source <(kubectl completion zsh)
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

## APPLICATIONS
# init zoxide (cd->z)
eval "$(zoxide init zsh)"

# init fzf history
source <(fzf --zsh)
#history config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Load Angular CLI autocompletion.
# source <(ng completion script)

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# find file and run nvim on it
fnv() {
  local find="$1"
    fd --hidden --exclude .git  "$find" | fzf --preview='bat {}' | xargs nvim
}

## BINDINGS
# autosuggest
# Set <tab> as word complete and double <tab> as history auto
bindkey '^I'   complete-word 
bindkey '^I^I' autosuggest-accept
# Make arrow keys always move the cursor on the command line
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
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

# ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi


