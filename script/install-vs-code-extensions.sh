#!/bin/bash
set -eu

extensions=(
  vscodevim.vim
  eamodio.gitlens
  rebornix.ruby
  golang.go
  ms-azuretools.vscode-docker
  PKief.material-icon-theme
  cometeer.spacemacs
)

args=(--force)
for extension in "${extensions[@]}"; do
  args+=(--install-extension "$extension")
done
exec code "${args[@]}"
