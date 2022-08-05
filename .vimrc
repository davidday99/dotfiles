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

" keep code selected when in/outdenting
vnoremap > >gv
vnoremap < <gv

" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'preservim/NERDTree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'lfv89/vim-interestingwords' 
Plug 'scrooloose/nerdcommenter'
call plug#end()

" Themes
colorscheme dracula

