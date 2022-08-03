" General configurations
set nu
filetype on
syntax on

filetype plugin indent on


" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'preservim/NERDTree'
call plug#end()

let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"

