local function get_catppuccin_theme(colors)
  local transparent_bg = colors.base

  return {
    normal = {
      a = { bg = colors.blue, fg = colors.mantle, gui = "bold" },
      b = { bg = colors.surface0, fg = colors.blue },
      c = { bg = transparent_bg, fg = colors.text },
    },

    insert = {
      a = { bg = colors.green, fg = colors.base, gui = "bold" },
      b = { bg = colors.surface0, fg = colors.green },
    },

    terminal = {
      a = { bg = colors.green, fg = colors.base, gui = "bold" },
      b = { bg = colors.surface0, fg = colors.green },
    },

    command = {
      a = { bg = colors.peach, fg = colors.base, gui = "bold" },
      b = { bg = colors.surface0, fg = colors.peach },
    },

    visual = {
      a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
      b = { bg = colors.surface0, fg = colors.mauve },
    },

    replace = {
      a = { bg = colors.red, fg = colors.base, gui = "bold" },
      b = { bg = colors.surface0, fg = colors.red },
    },

    inactive = {
      a = { bg = transparent_bg, fg = colors.blue },
      b = { bg = transparent_bg, fg = colors.surface1, gui = "bold" },
      c = { bg = transparent_bg, fg = colors.overlay0 },
    }
  }
end

-- plugin
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/noice.nvim",
    "catppuccin/nvim",
  },
	event = { "VeryLazy" },

	config = function(_, _)
    local noice = require("noice")
    local flavour = require("catppuccin").flavour
    local colors = require("catppuccin.palettes").get_palette(flavour)

		require("lualine").setup({
      options = {
        theme = get_catppuccin_theme(colors),
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "snacks_dashboard" },
      },

      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
          },
        },

        lualine_x = {
          {
            noice.api.statusline.mode.get,
            cond = noice.api.statusline.mode.has,
            color = { fg = colors.mauve },
          },
          "filesize",
        },
        lualine_y = {
          "searchcount",
          "selectioncount",
          "lsp_status",
          "filetype",
        },
        lualine_z = {
          "encoding",
          "location",
        },
      },
    })

		vim.opt.laststatus = 3
	end,
}

