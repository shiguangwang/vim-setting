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
Plugin 'jnurmine/Zenburn'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-signify'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'
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
set softtabstop=2
set sw=2
set t_Co=256
set tabstop=2
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
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"
" YouCompleteMe
"
let g:ycm_python_binary_path='python'
let g:ycm_complete_in_comments=0
let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
" syntastic -- syntax checker engine
" 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"
" NERDTree
"
let NERDTreeIgnore=['.pyc$', '\~$']

"
" command-t
"
let g:CommandTFileScanner = 'watchman'
let g:CommandTMaxCachedDirectories = 10
let g:CommandTSmartCase = 1

"
" vim-airline
"
let g:airline_powerline_fonts=1

"
" latex
"
let g:tex_flavor='latex'


"
" python
"
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set fileformat=unix
    \ match BadWhitespace /\s\+$/
    \ let python_highlight_all=1

"
" other keymap
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
