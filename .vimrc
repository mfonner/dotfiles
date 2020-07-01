" Theme stuff
syntax enable

" Pythonic line/space formatting
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab showmatch 

" Relative line numbers, highlighting current line
set ruler
set nu rnu
set numberwidth=1
hi LineNr ctermfg=220

" Pretty python code
let python_highlight_all=1

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Ensure you are using single quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmsvg/pear-tree'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" Enable smart pairs for pear-tree 
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" This line sets the file update time to 100ms
" By default, this value is 4s 
" We want this to be faster for use with gitgutter
set updatetime=100
