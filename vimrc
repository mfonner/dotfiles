" Syntax highlighting as well as Pythonic spacing
syntax on
colorscheme snazzy
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" I like being able to see character numbers as well
set ruler

" Setting hybrid line numbers and aligning them left
" LineNR toggles highlighting the current line
set nu rnu
set numberwidth=1
hi LineNr ctermfg=220

" pretty python code
let python_highlight_all=1

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
Plug 'connorholyday/vim-snazzy'
Plug 'valloric/youcompleteme'
Plug 'aserebryakov/vim-todo-lists'
Plug 'psf/black'

" List ends here. Plugins become visible to Vim after this call
call plug#end()
