-- KEYBINDINGS
-- Plugin specific keybindings are in the plugin's config files.

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap space as leader key. Leader key is a special key that will allow us to make some additional keybindings. I'm using a spacebar, but you can use whatever you'd wish. We'll use it (for example) for searching and changing files (by pressing spacebar, then `s` and then `f`).
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<leader>wl', '<C-w>h')
map('n', '<leader>wd', '<C-w>j')
map('n', '<leader>wu', '<C-w>k')
map('n', '<leader>wr', '<C-w>l')

-- Resize with arrows
-- map("n", "<C-Up>", ":resize -2<CR>")
-- map("n", "<C-Down>", ":resize +2<CR>")
-- map("n", "<C-Left>", ":vertical resize -2<CR>")
-- map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader><leader>", ":Telescope buffers theme=dropdown<CR>")
map("n", "<leader>tb", ":Telescope current_buffer_fuzzy_find theme=dropdown<CR>")
map("n", "<leader>tf", ":Telescope find_files theme=dropdown<CR>")
map("n", "<leader>tg", ":Telescope live_grep theme=dropdown<CR>")
map("n", "<C-p>", ":Telescope projects theme=dropdown<CR>")
map("n", "<leader>?", ":Telescope oldfiles theme=dropdown<CR>")

-- Navigate buffers
map("n", "<S-l>", ":BufferNext<CR>")
map("n", "<S-h>", ":BufferPrevious<CR>")

map('n', '<leader>tc', ':tabc<cr>')
map('n', '<leader>bc', ':BufferClose<cr>')
map('n', '<leader>bfc', ':BufferClose!<cr>')
map('n', '<leader>bn', ':BufferNext<cr>')
map('n', '<leader>bp', ':BufferPrevious<cr>')

-- Close Quickfix-List
map("n", "<leader>cc", "<cmd>:ccl<CR>")
-- Close LocationList
map("n", "<leader>ww", "<cmd>:lcl<CR>")

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Open/close symbol outline
map('n', '<leader>oo', ':SymbolsOutline<CR>')

map('n', '<leader>t', ':NvimTreeToggle<CR>')

map('n', '<leader>p', ':pu<CR>')

map('v', '<leader>cs', '"+y<CR>')

map('n', '<F5>', ":DapContinue<CR>")
map('n', '<F10>', ":DapStepInto<CR>")
map('n', '<F11>', ":DapStepOut<CR>")
map('n', '<F12>', ":DapStepOver<CR>")
map('n', '<leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
map('n', '<leader>B', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<leader>dr', "<cmd>lua require'dap'.repl.open()<CR>")
map('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<CR>")
map('n', '<leader>v', "<cmd>lua require'dapui'.eval()<CR>")

map('n', '<leader>xx', '<cmd>TroubleToggle<CR>')
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>')
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>')
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>')
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<CR>')
map('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>')
