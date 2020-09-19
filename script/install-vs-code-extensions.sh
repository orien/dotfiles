#!/bin/bash
set -eu

extensions=(
  vscodevim.vim
  eamodio.gitlens
  rebornix.ruby
  golang.go
  jakebecker.elixir-ls
  ms-azuretools.vscode-docker
  PKief.material-icon-theme
  cometeer.spacemacs
  MS-vsliveshare.vsliveshare
)

args=(--force)
for extension in "${extensions[@]}"; do
  args+=(--install-extension "$extension")
done
exec code "${args[@]}"
