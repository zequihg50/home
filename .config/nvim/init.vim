set fileencoding=utf-8
set nu
set relativenumber

set backspace=indent,eol,start

set autoindent

set history=50

set ruler
set showcmd
set showmode

set incsearch

filetype plugin indent on

inoremap jj <Esc>
:set guicursor=

" copy colors.vim in ~/.local/nvim/... first
syntax enable

" Plugins
call plug#begin('~/.config/nvim/plugged')

" List of plugins
Plug 'iCyMind/NeoSolarized'
Plug 'pearofducks/ansible-vim'

call plug#end()

" color
set termguicolors
set background=dark
colorscheme NeoSolarized

" ansible-vim
au BufRead,BufNewFile *.yml set ft=yaml.ansible
au BufRead,BufNewFile *.xml.j2 set filetype=xml.jinja2
let g:ansible_attribute_highlight = "ab"
