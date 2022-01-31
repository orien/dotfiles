# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#========= Oh My ZSH config =========

PATH="/opt/homebrew/bin:$PATH"
ZSH="$HOME/.dotfiles/repos/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
  fzf
  golang
  emoji
  gem
  gh
  git
  rust
  stack-master
  terraform
  npm
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

#========= some more jazz =========

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/repos/base16-shell"
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_gruvbox-dark-hard

alias lilypond='/Applications/LilyPond.app/Contents/Resources/bin/lilypond'
alias lilypond-book='/Applications/LilyPond.app/Contents/Resources/bin/lilypond-book'
alias convert-ly='/Applications/LilyPond.app/Contents/Resources/bin/convert-ly'

#export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
alias emacs='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait'
alias e='emacs'
alias vim='nvim'

. ~/.asdf/plugins/java/set-java-home.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
