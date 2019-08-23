#========= Oh My ZSH config =========

ZSH="$HOME/.dotfiles/repos/oh-my-zsh"
ZSH_THEME="orien"
DEFAULT_USER="orien"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"

plugins=(
  asdf
  aws
  brew
  bundler
  colored-man-pages
  docker
  docker-compose
  golang
  emoji
  gem
  git
  rust
  npm
  vscode
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

#========= some more jazz =========

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/repos/base16-shell"
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_railscasts

export LESSOPEN="|$(brew --prefix)/bin/lesspipe.sh %s" # Enable the lesspipe http://www-zeuthen.desy.de/~friebel/unix/lesspipe.html

alias lilypond='/Applications/LilyPond.app/Contents/Resources/bin/lilypond'
alias lilypond-book='/Applications/LilyPond.app/Contents/Resources/bin/lilypond-book'
alias convert-ly='/Applications/LilyPond.app/Contents/Resources/bin/convert-ly'

#export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
alias emacs='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait'
alias e='emacs'
