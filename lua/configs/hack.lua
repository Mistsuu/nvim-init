-- Background hacks
vim.api.nvim_set_hl(0, 'Normal', { bg = "none" })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = "none" })
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#cfe400" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })

-- Hide backgrounds for the main Telescope windows
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", ctermbg = "NONE" })

-- Seperator
vim.api.nvim_set_hl(0, 'WinSeparator',        { fg = '#3b4261', ctermfg = 243 })
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#3b4261", bg = "NONE" })

-- Hide backgrounds for the prompt, results, and preview entry lines
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE", ctermbg = "NONE" })

-- Notify has no background as well!
require("notify").setup({
  background_colour = "#000000",
})

