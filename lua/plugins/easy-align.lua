return {
  "junegunn/vim-easy-align",
  config = function ()
    vim.g.easy_align_delimiters = {
      ['\\'] = { pattern = '\\\\', left_margin = 1, right_margin = 1, stick_to_left = 0 }
    }
  end
}
