PATH="/opt/homebrew/bin:$PATH:$HOME/bin"
export FZF_DEFAULT_COMMAND='rg --files'
export VISUAL=nvim
export DELTA_PAGER='less -rR'
. "$HOME/.cargo/env"

export FZF_DEFAULT_OPTS="
--ansi
--bind='alt-k:preview-up,alt-p:preview-up'
--bind='alt-j:preview-down,alt-n:preview-down'
--bind='ctrl-r:toggle-all'
--bind='ctrl-s:toggle-sort'
--bind='?:toggle-preview'
--layout=reverse
"
