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
  config = function ()
    require("nvim-treesitter.configs").setup({
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
    })

  -- Claude told me this shit, i know nothing :(
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart = 99

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
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
    callback = function() vim.treesitter.start() end,
  })
  end,
}

