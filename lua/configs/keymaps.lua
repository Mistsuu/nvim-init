local mapkey = vim.keymap.set

-- Telescope keymaps
local telescope_builtin = require('telescope.builtin')
mapkey('n', '<C-g>', telescope_builtin.find_files, { desc = 'Telescope find files' })
mapkey('n', '<C-f>', telescope_builtin.live_grep, { desc = 'Telescope live grep' })

-- Neotree keymaps
mapkey('n', '<C-b>', '<cmd>Neotree toggle<CR><C-w>w')

-- Switch between multiple splits
mapkey('n', '<C-h>', '<cmd>wincmd h<CR>')
mapkey('n', '<C-j>', '<cmd>wincmd j<CR>')
mapkey('n', '<C-k>', '<cmd>wincmd k<CR>')
mapkey('n', '<C-l>', '<cmd>wincmd l<CR>')

-- Splits screen
mapkey('n', '<leader>\\', '<cmd>vsplit<CR>')
mapkey('n', '<leader>=', '<cmd>split<CR>')

-- Language Server
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local function lsp_opts(desc)
      return { buffer = args.buf, desc = "LSP " .. desc }
    end

    mapkey("n", "H", vim.lsp.buf.hover, lsp_opts "Displays infomation")
    mapkey("n", "gD", vim.lsp.buf.declaration, lsp_opts "Go to declaration")
    mapkey("n", "gd", vim.lsp.buf.definition, lsp_opts "Go to definition")
    mapkey("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, lsp_opts "Add workspace folder")
    mapkey("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, lsp_opts "Remove workspace folder")

    mapkey("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, lsp_opts "List workspace folders")

    mapkey("n", "<leader>D", vim.lsp.buf.type_definition, lsp_opts "Go to type definition")
    mapkey("n", "<leader>rn", vim.lsp.buf.rename, lsp_opts "Rename variable")
    mapkey("n", "<leader>ca", vim.lsp.buf.code_action, lsp_opts "Open code action")
  end
})

