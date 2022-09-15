#!/bin/bash
set -eu

extensions=(
  vscodevim.vim
  rebornix.ruby
  golang.go
  ms-azuretools.vscode-docker
  PKief.material-icon-theme
  cometeer.spacemacs
  github.vscode-pull-request-github
  eamodio.gitlens
  rust-lang.rust-analyzer
  ms-python.python
  denoland.vscode-deno
  sastan.twind-intellisense
)

args=(--force)
for extension in "${extensions[@]}"; do
  args+=(--install-extension "$extension")
done
exec code "${args[@]}"
