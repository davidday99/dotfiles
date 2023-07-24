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


" use ctrl-[hjkl] to select active split
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" use Shift+tab and Tab to move tab left or right 
nnoremap <C-I> :tabm +1<CR>
nnoremap <S-Tab> :tabm -1<CR>

" use ctrl-[jk] to navigate through command history
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>


" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' } "
Plug 'preservim/NERDTree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'lfv89/vim-interestingwords' 
Plug 'scrooloose/nerdcommenter'
call plug#end()


" Themes
colorscheme dracula


" YCM Configurations
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"let g:ycm_semantic_triggers = {
  "\   'c': [ 're!.' ],
  "\ }


" Autogenerate Ctags on file write to *.c/*.h files
set tags=./.tags,.tags
autocmd BufWritePost *.c,*.h silent! !ctags -R -f .tags &

