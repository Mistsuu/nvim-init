return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      python     = { "isort", "black" },
      html       = { "prettierd" },
      json       = { "prettierd" },
      yaml       = { "prettierd" },
      jsx        = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      vue        = { "prettierd" },
      qml        = { "qmlformat" },
      c          = { "clang-format" },
      cpp        = { "clang-format" },
      go         = { "gofmt" },
    },
  },
}
