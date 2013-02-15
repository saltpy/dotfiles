call pathogen#infect()

syntax on
filetype plugin indent on

set nobackup
set nowritebackup
set clipboard=unnamed

set tabstop=4
set shiftwidth=4
set expandtab

set wildmode=longest,list
set wildmenu
set laststatus=2
set cmdheight=2
:set statusline=%<%f\ (%{&ft}\ %-4(%m%)%=%-19(%31,%02c%03V%)

set showmatch
set incsearch
set hlsearch

set columns=80
set colorcolumn=80

au BufRead,BufNewFile *.scm set tabstop=2
au BufRead,BufNewFile Makefile set noexpandtab

let g:solarized_termcolors=16
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
