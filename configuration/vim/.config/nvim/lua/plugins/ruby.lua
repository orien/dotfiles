-- Configure Ruby support

---@type LazySpec
return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = { { "suketa/nvim-dap-ruby", commit = "ba36f9905ca9c6d89e5af5467a52fceeb2bbbf6d", config = true } },
  },
}
