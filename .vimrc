execute pathogen#infect()

" vi compatibility. Must be first to side effect other commands
set nocompatible

" Turn syntax highlighting on
syntax on
filetype plugin on

" Modified buffers can be hidden
set hidden

" Appearance
" set t_Co=256
"colorscheme molokai
set background=dark

" Turn line numbers on
set number

" Tabbing preferences
set softtabstop=2
set expandtab
set shiftwidth=2
set tabstop=2

" Highlight column 80
hi ColorColumn ctermbg=234
set colorcolumn=80

" Automatic indentation
filetype indent on

" Automatically wrap
" set textwidth=80

" Change the terminal's title
set title

" Enable mouse
"set mouse=a

""" Mappings

" Use ; instead of : in commands
nnoremap ; :

" Make up and down move by editor rows, not line rows.
nnoremap j gj
nnoremap k gk

" Leave insert mode with `jj'
inoremap jj <Esc>

" Forgot sudo?
cmap w!! w !sudo tee % >/dev/null

" Do not beep
set visualbell
set noerrorbells

" No backup or swap files
set nobackup
set noswapfile

" Filetype associations
autocmd BufNewFile,BufRead *.jsm set filetype=javascript

" Trailing whitespace detection
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
"autocmd BufWinEnter *.{c,cc,cpp,h,py,js,idl} match ExtraWhitespace /\s\+$/
"autocmd InsertEnter *.{c,cc,cpp,h,py,js,idl} match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave *.{c,cc,cpp,h,py,js,idl} match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave *.{c,cc,cpp,h,py,js,idl} call clearmatches()

" Spell checking for LaTeX only
autocmd FileType tex setlocal spell spelllang=en_us

" Settings for vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

