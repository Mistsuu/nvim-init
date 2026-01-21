return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  event = { 
    "BufReadPost",
    "BufNewFile"
  },
  lazy = true,
  build = ":TSUpdate",
  cmd = { 
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo"
  },
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c", 
      "cpp",
      "lua",
      "rust",
      "python",
      "vim",
      "html",
      "go",
      "asm",
      "bash",
      "dockerfile",
      "vimdoc",
      "luadoc"
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = {enable = true},
  },
}

