" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
call plug#end()

" Show current line number and relative number
set nu
set relativenumber

" Show the name of the opened file permanently
set statusline=%f
set laststatus=2

filetype plugin indent on
syntax on

set wildmenu
set wildmode=longest:list,full

" Move around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set , as leader
let mapleader = ","

" Ansible YAML
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal tabstop=2
autocmd FileType yaml setlocal expandtab
