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
"workaround for showmatch to scroll the screen
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

"colorscheme torte
colorscheme hickop
set cursorline
set ruler
set showcmd
set mouse=a

set noswapfile

syntax on
filetype on
set number

nmap <leader>t :TagbarToggle<CR>
set foldmethod=indent
set foldlevel=99

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

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

let g:SuperTabClosePreviewOnPopupClose=1

"auto cpp complete
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/opencv.tags
set tags+=~/.vim/tags/current_tags;
"set tags+=~/.vimtags

"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
"set tags+=~/.vim/tags/gtkmm2.4
"set tags+=~/.vim/tags/gtkmm3.0

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 "show function parameters
let OmniCpp_MayCompleteDot = 1 "autocomplete after .
let OmniCpp_MayCompleteArrow = 1 "autocomplete after ->
let OmniCpp_MayCompleteScope = 1 "autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"build tags for current project
map <leader>ct :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q -f /home/sim0n/.vim/tags/current_tags .<CR>

autocmd FileType c map <F9> :!gcc -o "%:p:r" "%:p" && "%:p:r"<CR>
autocmd FileType c map <F8> :!gcc -o "%:p:r" "%:p" <bar> more<CR>
autocmd FileType c map <F7> :!"%:p:r"<CR>

autocmd FileType cpp map <F5> :!make<CR>
autocmd FileType cpp map <F9> :!"%:p:r"<CR>

autocmd FileType python map <F9> :!python "%:p"<CR>
autocmd FileType python map <F8> :!python2 "%:p"<CR>
autocmd FileType python set omnifunc=pythoncomplete#Complete
