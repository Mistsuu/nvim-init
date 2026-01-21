return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = require("configs.lsp").servers
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig"
    }
  },

  {
    "neovim/nvim-lspconfig",
    config = require("configs.lsp").register_servers
  }
}

