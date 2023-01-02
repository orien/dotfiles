# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#========= Oh My ZSH config =========

ZSH="$HOME/.dotfiles/repos/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER="orien"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
VI_MODE_SET_CURSOR="true"

plugins=(
  vi-mode
  asdf
  aws
  brew
  bundler
  colored-man-pages
  docker
  docker-compose
  fzf
  golang
  emoji
  gem
  gh
  git
  forgit
  rust
  stack-master
  terraform
  npm
  zsh-syntax-highlighting
  aws-vault
)

source "$ZSH/oh-my-zsh.sh"

#========= some more jazz =========

export KEYTIMEOUT=15

alias lilypond='/Applications/LilyPond.app/Contents/Resources/bin/lilypond'
alias lilypond-book='/Applications/LilyPond.app/Contents/Resources/bin/lilypond-book'
alias convert-ly='/Applications/LilyPond.app/Contents/Resources/bin/convert-ly'

#export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
alias emacs='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait'
alias e='emacs'
alias vim='nvim'
alias vi='nvim'

. ~/.asdf/plugins/java/set-java-home.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Remove one or more docker images
drmi() {
  local query="$1:-"
  docker images | sed 1d | fzf --query="$query" --no-sort --multi --tac | awk '{ print $3 }' | xargs -r docker rmi
}
