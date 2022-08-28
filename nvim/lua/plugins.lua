-- PLUGINS

-- Install packer. You don't have to necessarily understand this code. Just know that it will grab packer from the Internet and install it for you.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- Here we can declare the plugins we'll be using.
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager itself.

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }
  
  use 'tpope/vim-fugitive' -- Git commands for nvim.

  -- Cemment
  use 'numToStr/Comment.nvim'

  use 'tpope/vim-surround' -- A great tool for adding, removing and changing braces, brackets, quotes and various tags around your text.

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- UI to select things (files, search results, open buffers...)
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} } -- A bar that will show at the top of you nvim containing your open buffers. Similarly to how other editors show tabs with open files.

  use 'itchyny/lightline.vim' -- Fancier status line with some information that will be displayed at the bottom.

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Adds git related info in the signs columns (near the line numbers) and popups.

  use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code using a fast incremental parsing library. Treesitter is used by nvim for various things, but among others, for syntax coloring. Make sure that any themes you install support treesitter!
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter.

  -- Package management (LSPs and other stuff)
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client.
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin.
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use 'glepnir/lspsaga.nvim'


  -- Snippets
  use 'L3MON4D3/LuaSnip' -- Snippets plugin.
  use 'rafamadriz/friendly-snippets' -- Snippets collection

  -- Colorscheme
  use 'folke/tokyonight.nvim' -- tokyonight theme

  -- Code outline
  use 'simrat39/symbols-outline.nvim' -- Code outline

  -- Inline hex colors
  use 'NvChad/nvim-colorizer.lua' -- Inline colorizer

  -- Startscreen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
end)

-- luasnip setup (you can leave this here or move it to its own configuration file in `lua/plugs/luasnip.lua`.)
luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets from friendly-snippets

-- Dlang language server
require'lspconfig'.serve_d.setup{}
