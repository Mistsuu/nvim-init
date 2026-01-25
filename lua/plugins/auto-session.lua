return {
  "rmagatti/auto-session",
  lazy = false,
  config = function ()
    -- vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    require("auto-session").setup({
      suppressed_dirs = {
        "~/",
        "~/Downloads",
        "/"
      },
      bypass_save_filetypes = {
        "neo-tree"
      },
      close_filetypes_on_save = {
        "neo-tree",
        "checkhealth"
      },
      -- enabled = false,
      -- auto_save = false,
      -- auto_restore = false,
      -- auto_create = false,
    })
  end
}

