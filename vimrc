call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
call plug#end()

"Standard bits
let mapleader = "-"
syntax enable
filetype plugin indent on
set nu
set nocp
set nobackup
set nowritebackup
set clipboard=unnamed
set wildmode=longest,list
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*/build/*,*/node_modules/*,*.vagrant/*,*.git/*,*/local/*,*/target/*
set wildmenu
set laststatus=2
set cmdheight=2
set showmatch
set incsearch
set hlsearch
set autoread

"Look and feel
let g:solarized_termcolors=256
set background=light
colorscheme solarized

"Setup movement keys for window navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

"Setup code folding
set foldmethod=indent
set foldlevel=99
noremap <space> za

"Setup code editing
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set autoindent
set fileformat=unix

"Setup Makefile indentation
au BufNewFile,BufRead Makefile* set noexpandtab

"Buffer nav
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>
nmap <leader>bl :ls<CR>

function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vne ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
    if line('$') == 1 && getline(1) == ''
        silent! execute 'wincmd c' 
        echo 'Shell command ' . command . ' produced no output.'
    else 
        silent! normal! gg=G
        silent! execute 'wincmd p'
    endif
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
