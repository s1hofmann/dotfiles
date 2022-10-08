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
require("plugs.cloak")
require("plugs.indent")
require("plugs.project")
require("plugs.lualine")
require("plugs.formatter")
require("plugs.dapui")
require("plugs.leap")
require("plugs.trouble")

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
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.smartindent = true -- make indenting smarter again

vim.opt.foldenable = true 

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- number of spaces that <Tab> uses while editing

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
vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme onedarkpro")  -- Lua

-- local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
-- if (string.find(theme, 'Dark')) then
-- 	vim.g.tokyonight_style = "storm"
-- else
-- 	vim.g.tokyonight_style = "day"
-- end
