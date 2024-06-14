# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## ZSH PLUGINS
plugins=( 
	git
	zsh-autosuggestions
  terraform
)

source /Users/adamwilczek/.docker/init-zsh.sh || true # Added by Docker Desktop
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## APPLICATIONS
# init zoxide (cd->z)
eval "$(zoxide init zsh)"

# init fzf 
source <(fzf --zsh)

# Load Angular CLI autocompletion.
# source <(ng completion script)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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

## DIRs
export REPO="$HOME/Documents/repos"
