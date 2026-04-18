-- Pony language support
-- pony-lsp has no lspconfig entry, so we configure it via the native Neovim LSP API.

vim.lsp.config("ponylsp", {
  cmd = { vim.fn.expand "~/pony/bin/pony-lsp" },
  filetypes = { "pony" },
  root_markers = { "corral.json", ".git" },
})

vim.lsp.enable "ponylsp"

---@type LazySpec
return {}
