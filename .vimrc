" General configurations
set nu
filetype on
syntax on

filetype plugin indent on

" more powerful backspacing
set backspace=2


" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" keep code selected when in/outdenting
vnoremap > >gv
vnoremap < <gv

" use Shift+tab and Tab to move tab left or right 
nnoremap <Leader><C-I> :tabm +1<CR>
nnoremap <S-Tab> :tabm -1<CR>

" use ctrl-[jk] to navigate through command history
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>


" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --all' } "
Plug 'preservim/NERDTree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'lfv89/vim-interestingwords' 
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/markonm/traces.vim.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'embear/vim-localvimrc'
call plug#end()


" YCM Mappings
nnoremap <Leader>g :YcmCompleter GoTo<CR>
nnoremap <Leader>r :YcmCompleter RefactorRename  


" Themes
colorscheme dracula


" YCM Configurations
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Localvimrc Configurations
let g:localvimrc_ask = 0

"let g:ycm_semantic_triggers = {
  "\   'c': [ 're!.' ],
  "\ }


" Autogenerate Ctags on file write to *.c/*.h files
set tags=./tags;,tags;
"autocmd BufWritePost *.c,*.h silent! !ctags -R -f .tags &

" Manual syntax associations
au Bufread,BufNewFile *.dt set syntax=c

