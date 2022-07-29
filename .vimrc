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


" YCM Code Completion
set rtp+=~/.vim/pack/YouCompleteMe
set completeopt-=preview
" Git Switcher
set rtp+=~/.vim/pack/git-switcher.vim

set rtp+=~/.vim/pack/vendor/start/nerdcommenter
