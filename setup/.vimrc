inoremap jk <Esc> "remap Esc to jk

syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab "expand tabs into spaces
set showcmd " show when you press leader key.
" Key maps and remaps:
nnoremap <space> <Nop>
let mapleader = " " "leader button

nnoremap <silent> <C-l> :nohl<CR> "Redraws screen and clears highlighted search
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D
map <F2> :bprev<CR> "previous bugger
map <F3> :bnext<CR>

" Shift tab to the left normal mode
nnoremap <S-Tab> <<
" For insert mode
inoremap <S-Tab> <C-d>


" Disable arrow keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Disable arrow keys in visual mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
