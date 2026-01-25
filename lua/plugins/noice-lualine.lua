return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function ()
      local noice = require("noice")

      require("lualine").setup({
        theme = "dracula",
        sections = {
          -- configure outputs directly in lualine
          lualine_x = {
            {
              noice.api.statusline.mode.get,
              cond = noice.api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            }
          },
        },
      })

    end
  },
}

