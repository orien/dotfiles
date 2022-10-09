local null_ls = require('null-ls')
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
null_ls.setup({
  sources = {
    code_actions.proselint,
    diagnostics.proselint,
    hover.dictionary,

    code_actions.gitsigns,

    code_actions.shellcheck,
    diagnostics.shellcheck,
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'Gitcommit', 'Markdown', 'Text' },
  callback = function() vim.opt_local.spell = true end,
})

-- Install
require('mason').setup()
require('mason-lspconfig').setup()

-- Use fidget to display nvim-lsp progress
require('fidget').setup({})

-- Completetion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    { name = 'nvim_lsp_signature_help' },
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
lspconfig.sumneko_lua.setup({ -- Lua
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telementry = { enable = false },
    }
  },
})
lspconfig.terraformls.setup({ capabilities = capabilities }) -- Terraform
lspconfig.tsserver.setup({ capabilities = capabilities }) -- Typescript
require('rust-tools').setup() -- Rust
local rt = require('rust-tools')
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Configure keymap for LSP functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    end
  end,
})

require('symbols-outline').setup()

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'go', 'lua', 'ruby', 'rust', 'typescript' },
  sync_install = false,
  auto_install = true,
})
