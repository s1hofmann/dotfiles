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
map('n', '<S-h>', '<C-w>h')
map('n', '<S-j>', '<C-w>j')
map('n', '<S-k>', '<C-w>k')
map('n', '<S-l>', '<C-w>l')

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
-- map("n", "<S-l>", ":bnext<CR>")
-- map("n", "<S-h>", ":bprevious<CR>")

map('n', 'ct', ':tabc<cr>')

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

