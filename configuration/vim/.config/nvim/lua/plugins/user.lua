---@type LazySpec
return {

  -- AstroNvim pins aerial.nvim to "^2.2" in its lazy_snapshot.lua
  -- (github.com/AstroNvim/AstroNvim, lua/astronvim/lazy_snapshot.lua).
  -- The fix for Neovim 0.12 compatibility (removal of the deprecated
  -- iter_matches({all = false}) API) landed in aerial.nvim v3.1.0 and has
  -- not been backported to the v2 series. This override bumps the version
  -- constraint to "^3" so that lazy.nvim will install v3.x instead.
  { "stevearc/aerial.nvim", version = "^3" },

  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "      ▄▄▄  ▪  ▄▄▄ . ▐ ▄ .▄▄ ·       ",
            "▪     ▀▄ █·██ ▀▄.▀·•█▌▐█▐█ ▀.       ",
            " ▄█▀▄ ▐▀▀▄ ▐█·▐▀▀▪▄▐█▐▐▌▄▀▀▀█▄      ",
            "▐█▌.▐▌▐█•█▌▐█▌▐█▄▄▌██▐█▌▐█▄▪▐█      ",
            " ▀█▄▀▪.▀  ▀▀▀▀ ▀▀▀ ▀▀ █▪ ▀▀▀▀       ",
            "     ▄▄▄ .·▄▄▄▄  ▪  ▄▄▄▄▄      ▄▄▄  ",
            "     ▀▄.▀·██▪ ██ ██ •██  ▪     ▀▄ █·",
            "     ▐▀▀▪▄▐█· ▐█▌▐█· ▐█.▪ ▄█▀▄ ▐▀▀▄ ",
            "     ▐█▄▄▌██. ██ ▐█▌ ▐█▌·▐█▌.▐▌▐█•█▌",
            "      ▀▀▀ ▀▀▀▀▀• ▀▀▀ ▀▀▀  ▀█▄▀▪.▀  ▀",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
