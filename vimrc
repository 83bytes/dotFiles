" for airline 
set laststatus=2

" for autoindent and plugins based on filetype
set autoindent
filetype indent on
filetype plugin on
set modelines=0
syntax on

" utf-8
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11
set guifontwide=NSimsun:h12

" to stop it from being compatible with vi 
set nocompatible

" to set number and relative number
set number
set relativenumber

" set 'jk' as esc button
inoremap jk <esc>

" NERDTree config
map <f5> :NERDTreeToggle<CR>

" start NERDTree on vim startup
" autocmd vimenter * NERDTree

" BEGINING VIM-PLUG calls

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline' " vim air-line

Plug 'scrooloose/nerdtree'     " vim NERDTree

Plug 'bling/vim-bufferline'    " vim bufferline

call plug#end() 
