-- GENERAL SETTINGS
-- Dependencies

require("plugins")
require("keybindings")
require("lsp")
require("plugs.treesitter")
require("plugs.cmp")
require("plugs.telescope")
require("plugs.gitsigns")
require("plugs.outline")
require("plugs.colorizer")
require("plugs.nvimtree")
require("plugs.mason")
require("plugs.comment")

-- Incremental live completion (note: this is now a default on master).
vim.o.inccommand = 'nosplit'

-- Set highlight on search. This will remove the highlight after searching for text.
vim.o.hlsearch = false

-- Make relative line numbers default. The current line number will be shown as well as relative numbering from that current line. It makes navigating around code easier.
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers (note: default on master).
vim.o.hidden = true

-- Enable mouse mode. Sometimes it's easier to scroll using the touchpad for example.
vim.o.mouse = 'a'

-- Enable break indent.
vim.o.breakindent = true

-- Save undo history.
vim.opt.undofile = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time.
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme defaults (order is important here).
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.o.background = 'dark'
vim.cmd [[colorscheme tokyonight]]

-- Set status bar settings, it might throw errors because we haven't installed the `moonfly` theme yet, so don't worry about that. 
vim.g.lightline = {
  colorscheme = 'tokyonight',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

vim.api.nvim_command [[autocmd! User LspDiagnosticsChanged lua update_diagnostics_loclist()]]

-- Set dark theme if macOS theme is dark, light otherwise.
vim.cmd[[colorscheme tokyonight]]
-- local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
-- if (string.find(theme, 'Dark')) then
-- 	vim.g.tokyonight_style = "storm"
-- else
-- 	vim.g.tokyonight_style = "day"
-- end
