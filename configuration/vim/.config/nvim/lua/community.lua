-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.gruvbox-baby" },

  { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.motion.nvim-surround" },

  -- Ruby is configured manually (ruby.lua, neotest.lua, mason.lua, treesitter.lua):
  -- astrocommunity.pack.ruby uses solargraph instead of ruby-lsp and has no neotest integration
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.elm" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.test.neotest" },
}
