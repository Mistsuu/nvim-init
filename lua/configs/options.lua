-- Setup tabs as multiple space
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set numbering system
vim.cmd("set number")
vim.cmd("set rnu")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Copy to clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- Kitty margin management
if vim.env.KITTY_WINDOW_ID then
  vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
      vim.fn.system("kitty @ set-spacing padding=0")
    end,
  })

  vim.api.nvim_create_autocmd("UILeave", {
    callback = function()
      vim.fn.system("kitty @ set-spacing padding=15")
    end,
  })
end

-- Set coloring
vim.opt.termguicolors = true

-- Session options
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

