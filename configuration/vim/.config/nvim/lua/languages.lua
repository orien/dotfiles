local null_ls = require('null-ls')
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
-- local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
null_ls.setup({
  sources = {
    code_actions.proselint,
    diagnostics.proselint,
    completion.spell,
    hover.dictionary,

    code_actions.shellcheck,
    diagnostics.shellcheck,
  },
})

-- Install
require('mason').setup()
require("mason-lspconfig").setup()

-- Use fidget to display nvim-lsp progress
require("fidget").setup({})

-- Completetion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help'},
    { name = 'nvim_lua' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Enable language servers for some programming languages
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.gopls.setup({ capabilities = capabilities }) -- Go
lspconfig.solargraph.setup({ capabilities = capabilities }) -- Ruby
lspconfig.sumneko_lua.setup({ capabilities = capabilities }) -- Lua
lspconfig.tsserver.setup({ capabilities = capabilities }) -- Typescript
