-- Configure neotest

---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = function(_, opts)
      opts.ft = require("astrocore").list_insert_unique(opts.ft, {
        "ruby",
      })
      opts.adapters = require("astrocore").list_insert_unique(opts.adapters, {
        require "neotest-rspec",
      })
    end,
  },
}
