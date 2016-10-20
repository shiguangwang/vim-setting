"
" setup vundle
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" ++++++++++ Your plugins go here ++++++++++
Plugin 'altercation/vim-colors-solarized'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'wincent/command-t'
Plugin 'Yggdroot/indentLine'
call vundle#end()
filetype plugin indent on


"
" misc.
"
filetype plugin on
syntax enable

let mapleader=','

set autoindent
set cursorline
set encoding=utf-8
set expandtab
set grepprg=grep\ -nH\ $*
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set number
set ruler
set showmatch
set smartcase
set sw=2
set t_Co=256
set timeout timeoutlen=1000
set whichwrap+=<,>,h,l,[,]

hi CursorLine gui=none cterm=none


"
" code folding
"
set foldlevel=99
set foldmethod=indent



"
" mouse
"
set ttyfast
set mouse=a
set ttymouse=xterm

"
" color theme
"
set background=dark
colorscheme solarized
let g:solarized_termcolors=256


"
" latex
"
let g:tex_flavor='latex'


"
" custom keymap
"
noremap <C-A> <HOME>
noremap <C-E> <END>
" normal mode
nnoremap <C-L> :set invnumber<CR>
nnoremap U <C-R>
nnoremap K i<CR><ESC>
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>it :IndentLinesToggle<CR>
" insert mode
inoremap <C-K> <ESC>lDa
