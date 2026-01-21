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
      main = "telescope",
      opts = {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      },
      config = function()
        require("telescope").load_extension("ui-select")
      end
    }
  }

