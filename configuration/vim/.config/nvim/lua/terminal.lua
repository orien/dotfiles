
require("toggleterm").setup({
  shading_factor = -16,
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-w>l', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>p', [[<Cmd>wincmd p<CR>]], opts)
  vim.keymap.set('t', '<C-w>b', [[<Cmd>wincmd b<CR>]], opts)
  vim.keymap.set('t', '<C-w>t', [[<Cmd>wincmd t<CR>]], opts)
  vim.keymap.set('t', '<C-w>w', [[<Cmd>wincmd w<CR>]], opts)
end

vim.api.nvim_create_autocmd(
  'TermOpen',
  { pattern = 'term://*', command = 'lua set_terminal_keymaps()' }
)
