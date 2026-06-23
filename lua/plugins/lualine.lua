-- Shoutout to https://github.com/bibjaw99/workstation/blob/master/config_dotfiles/config/nvim/lua/grimmvim/plugins/ui/lualine.lua
-- And https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/utils/lualine.lua
-- define colors
local colors = {
	rosewater = "#f4dbd6",
	flamingo = "#f0c6c6",
	pink = "#f5bde6",
	mauve = "#c6a0f6",
	red = "#ed8796",
	maroon = "#ee99a0",
	peach = "#f5a97f",
	yellow = "#eed49f",
	green = "#a6da95",
	teal = "#8bd5ca",
	sky = "#91d7e3",
	sapphire = "#7dc4e4",
	blue = "#8aadf4",
	lavender = "#b7bdf8",
	text = "#cad3f5",
	subtext1 = "#b8c0e0",
	subtext0 = "#a5adcb",
	overlay2 = "#939ab7",
	overlay1 = "#8087a2",
	overlay0 = "#6e738d",
	surface2 = "#5b6078",
	surface1 = "#494d64",
	surface0 = "#363a4f",
	base = "#24273a",
	mantle = "#1e2030",
	crust = "#181926",
}

-- custom modifications
local transparent_bg = colors.base

local catppuccin = {
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
  },
}

-- plugin
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "VeryLazy" },

	config = function(_, _)
    local noice = require("noice")

		require("lualine").setup({
      options = {
        theme = catppuccin,
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
            path = 3,
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

