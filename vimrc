call pathogen#infect()

syntax enable
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

set showmatch
set incsearch
set hlsearch

set colorcolumn=80

au BufRead,BufNewFile Makefile set noexpandtab

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*/build/*,*/node_modules/*,*.vagrant/*,*.git/*
