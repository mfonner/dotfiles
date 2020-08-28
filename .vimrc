" My .vimrc file which is basically copy and pasted from Jess Fraz's here:
" https://github.com/jessfraz/.vim/blob/master/vimrc
"
" I've also taken a few lines from Luke Smith's .vimrc (he's using Neovim but
" whatevs)
" https://github.com/LukeSmithxyz/voidrice/blob/master/.config/nvim/init.vim

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmsvg/pear-tree'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'

" Initialize plugin system
call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

"
" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set nu rnu
set numberwidth=1

set noswapfile                  " Don't use swapfile
set nobackup					          " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" set ttyscroll=3               " noop on linux ?
set lazyredraw          	      " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" do not hide markdown
set conceallevel=0

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1

" Apply the indentation of the current line to the next line.
set autoindent
set smartindent
set complete-=i
set showmatch
set smarttab

set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

syntax enable
if has('gui_running')
  set transparency=3
  " fix js regex syntax
  set regexpengine=1
  syntax enable
endif
set background=dark
" let g:hybrid_use_Xresources = 1
" let g:rehash256 = 1
"colorscheme dracula 
"set guifont=Inconsolata:h15
set guioptions-=L

" Coc completion menu and related highlighting
hi Pmenu ctermbg=NONE guibg=NONE ctermfg=gray guifg=gray
hi PmenuSel ctermbg=yellow guibg=yellow

" Parenthesis highlighting
" Setting background to none only changes the parenthesis color themselves
" I find this less distracting
hi MatchParen cterm=NONE ctermbg=NONE ctermfg=red

"hi CocErrorSign ctermfg=red guifg=#e68183
"hi CocWarningSign ctermfg=yellow guifg=#ff922b

"hi NormalFloat guibg=DarkGray guifg=#323d43
"hi CoCErrorFloat guibg=DarkGray guifg=#e68183

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Do not show stupid q: window
map q: :q

" Sometimes this happens and I hate it
map :Vs :vs
map :Sp :sp

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" spell check for git commits
autocmd FileType gitcommit setlocal spell

" Plugin configs
" Enable smart pairs for pear-tree 
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" This line sets the file update time to 100ms
" By default, this value is 4s 
" We want this to be faster for use with gitgutter
set updatetime=100

" Setting git-gutters column highlighting
highlight! link SignColumn LineNr

" COC settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" Fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>
