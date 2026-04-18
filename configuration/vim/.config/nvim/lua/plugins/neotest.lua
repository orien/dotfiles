-- Configure neotest

---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      { "olimorris/neotest-rspec", commit = "e7dc67c1167a9e593c804a6be6808ba9a5920d43" },
    },
    opts = function(_, opts)
      opts.adapters = require("astrocore").list_insert_unique(opts.adapters, {
        require "neotest-rspec",
      })
    end,
  },
}
