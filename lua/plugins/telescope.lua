return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("ui-select")

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--no-ignore", -- added this, the rest above are defaults
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        },
        pickers = {
          find_files = {
            no_ignore = true
          },
        }
      })
    end
  }
}

