return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      -- lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      -- rust = { "rustfmt", lsp_format = "fallback" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      jsx = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      vue = { "prettierd" },
      qml = { "qmlformat" },
    },
  },
}
