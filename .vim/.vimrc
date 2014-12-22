let mapleader=","
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_MultipleCompileFormats = "dvi,pdf"

"display statusbar
set laststatus=2

"goto matching bracket when closing a bracket
set showmatch

"Expands <CR> inside brackets
let g:delimitMate_expand_cr=1
"Remap S-Tab to Control-L to jump over closing delimiters, e.g. brackets
imap <C-L> <Plug>delimitMateS-Tab

"Settings for ultiSnips
let g:UltiSnipsSnippetDir="~/.vim/ultisnips"
let g:UltiSnipsExpandTrigger="<S-E>e"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"workaround for showmatch to scroll the screen
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

"colorscheme torte
colorscheme hickop
let g:airline_theme='lucius'

set cursorline

"change color of column 81 to indicate max. length of lines
"as recommended by python style guidelines
autocmd FileType python set colorcolumn=81

set ruler
set showcmd
set mouse=a

set noswapfile

syntax on
filetype on
set relativenumber
set number


map <leader>td <Plug>TaskList
nmap <leader>t :TagbarToggle<CR>
set foldmethod=indent
set foldlevel=99

"SuperTab settings
let g:SuperTabDefaultCompletionType = "<C-n>"
set completeopt=menuone,longest,preview
let g:SuperTabClosePreviewOnPopupClose=1
"Accept selected completion using <Enter> key
let g:SuperTabRetainCompletionType=2
inoremap <expr><Enter> pumvisible() ? "\<C-y>" : "\<Enter>"

"spellcheck
nmap <leader>ec :set spell spelllang=en_us<CR>
nmap <leader>dc :set spell spelllang=de_de<CR>
nmap <leader>nc :set nospell<CR>

"mappings for quickfix window
nmap <F2> :ccl<CR>
nmap <F3> :cn<CR>

"fast window navigation
"
"this line is needed to avoid <C-j> from getting remapped by vim-latexsuite
nnoremap <C-space> <Plug>IMAP_JumpForward

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Vimplate template plugin
let Vimplate = "/usr/bin/vimplate"

"pep8 settings for python
set ts=4 sw=4 sts=4 et
set autoindent
set smartindent
set smarttab

"auto cpp complete
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/*/tags

"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
"set tags+=~/.vim/tags/gtkmm2.4
"set tags+=~/.vim/tags/gtkmm3.0

let OmniCpp_NamespaceSearch = 2     "namespaces from current buffer and included files
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
"let OmniCpp_DisplayMode = 1         "show all members
let OmniCpp_ShowScopeInAbbr = 1     
let OmniCpp_ShowPrototypeInAbbr = 1 "show function parameters
let OmniCpp_MayCompleteDot = 1 "autocomplete after .
let OmniCpp_MayCompleteArrow = 1 "autocomplete after ->
let OmniCpp_MayCompleteScope = 1 "autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "cv"]

"build tags for current project
"work in progress...

autocmd FileType c map <F9> :!gcc -o "%:p:r" "%:p" && "%:p:r"<CR>
autocmd FileType c map <F8> :!gcc -o "%:p:r" "%:p" <bar> more<CR>
autocmd FileType c map <F7> :!"%:p:r"<CR>

autocmd FileType cpp map <F5> :!make<CR>
autocmd FileType cpp map <F9> :!"%:p:r"<CR>
"autocmd FileType cpp call Test()

autocmd FileType python map <F9> :!python "%:p"<CR>
autocmd FileType python map <F8> :!python2 "%:p"<CR>
"autocmd FileType python set omnifunc=pythoncomplete#Complete
