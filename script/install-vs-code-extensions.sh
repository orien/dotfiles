#!/bin/bash
set -eu

extensions=(
  dbaeumer.vscode-eslint
  denoland.vscode-deno
  GitHub.copilot
  GitHub.copilot-chat
  GitHub.github-vscode-theme
  GitHub.vscode-pull-request-github
  golang.go
  hashicorp.terraform
  KoichiSasada.vscode-rdbg
  ms-azuretools.vscode-docker
  ms-kubernetes-tools.vscode-kubernetes-tools
  ms-python.isort
  ms-python.python
  ms-python.vscode-pylance
  ms-toolsai.jupyter
  ms-toolsai.jupyter-keymap
  ms-toolsai.jupyter-renderers
  ms-toolsai.vscode-jupyter-cell-tags
  ms-toolsai.vscode-jupyter-slideshow
  ms-vscode-remote.remote-containers
  ms-vsliveshare.vsliveshare
  PKief.material-icon-theme
  redhat.vscode-yaml
  rust-lang.rust-analyzer
  sastan.twind-intellisense
  Shopify.ruby-extensions-pack
  Shopify.ruby-lsp
  sorbet.sorbet-vscode-extension
  vscjava.vscode-maven
  vscodevim.vim
  wingrunr21.vscode-ruby
)

args=(--force)
for extension in "${extensions[@]}"; do
  args+=(--install-extension "$extension")
done
exec code "${args[@]}"
