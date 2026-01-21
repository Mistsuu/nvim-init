return { 
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    vim.cmd.colorscheme "catppuccin"
  end
}

