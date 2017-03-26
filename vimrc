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
au BufRead,BufWrite *.js,*.html,*.css set shiftwidth=2
au BufRead,BufWrite *.js,*.html,*.css set tabstop=2

let g:solarized_termcolors=256
set background=light
colorscheme solarized

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*/build/*,*/node_modules/*,*.vagrant/*,*.git/*,*/local/*,*/target/*

function! BufferEmpty()

endfunction

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

command Shlint Shell shellcheck -Cnever -x %
