#========= Oh My ZSH config =========

ZSH="$HOME/.dotfiles/repos/oh-my-zsh"
DEFAULT_USER="orien"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
VI_MODE_SET_CURSOR="true"

plugins=(
  brew
  vi-mode
  asdf
  aws
  bundler
  colored-man-pages
  direnv
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
  starship
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

# Remove one or more docker images
drmi() {
  local query="${1:-}"
  docker images | sed 1d | fzf --query="$query" --no-sort --multi --tac | awk '{ print $3 }' | xargs -r docker rmi
}
