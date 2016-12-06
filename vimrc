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
Plugin 'elzr/vim-json'
Plugin 'edsono/vim-matchit'
Plugin 'klen/python-mode'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'luochen1990/rainbow'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'
Plugin 'mtth/scratch.vim'
Plugin 'nvie/vim-flake8'
Plugin 'raphamorim/lucario'
Plugin 'Raimondi/delimitMate'
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
Plugin 'vim-scripts/closetag.vim'
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

let mapleader = ','

set autoindent
set backspace=indent,eol,start
set completeopt-=preview
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
" set background=dark
" colorscheme solarized
" colorscheme lucario
colorscheme jellybeans
let g:jellybeans_use_term_italics = 1
" let g:solarized_termcolors = 256

"
" rainbow
"
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle


"
" indentLine
"
let g:indentLine_concealcursor = 'nc'
let g:indentLine_conceallevel = 2

"
" YouCompleteMe
"
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 0
let g:ycm_autoclose_preview_window_after_completion = 1
map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
" syntastic -- syntax checker engine
" 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

"
" NERDTree
"
let NERDTreeIgnore = ['.pyc$', '\~$']
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <ESC>:NERDTreeToggle<CR>

"
" Undotree
"
nnoremap <F4> :undotreeToggle<CR>
inoremap <F4> <ESC>:undotreeToggle<CR>

"
" NERDCommenter
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1

"
" command-t
"
let g:CommandTMaxFiles = 500000
let g:CommandTMaxDepth = 20
let g:CommandTMaxHeight = 0
let g:CommandTFileScanner = 'watchman'
let g:CommandTMatchWindowReverse = 0
let g:CommandTMaxCachedDirectories = 10
let g:CommandTInputDebounce = 50
let g:CommandTSmartCase = 1

"
" vim-airline
"
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'
set guifont=Sauce\ Code\ Powerline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

"
" latex
"
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""
if has("macunix")
  let g:Tex_CompileRule_pdf = 'latexmk -pdf -synctex=1 --shell-escape --interaction=nonstopmode $*'
  " let g:Tex_TreatMacViewerAsUNIX = 1
  let g:Tex_ViewRule_pdf = 'open -a Skim'
  map ,ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
endif


"
" python
"
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_doc_bind = "<C-S-d>"

"
" tagbar
"
nmap <F8> :TagbarToggle<CR>

"
" Make <C-K> work exactly the same in INSERT mode as emacs
"
function EmacsCKKey()
  if col(".") == 1
    execute "normal! D"
  else
    execute "normal! lD"
  endif
endfunction
inoremap <C-K> <ESC>:call EmacsCKKey()<CR>a

" other keymap
"
" normal mode
nnoremap <C-A>        <HOME>
nnoremap <C-E>        <END>
nnoremap <C-L>        :set invnumber<CR>
nnoremap U   <C-R>
nnoremap K   i<CR><ESC>
nnoremap <Leader>a    :Ack!<Space>
nnoremap <Leader>it   :IndentLinesToggle<CR>
nnoremap <Leader>o    :on<CR>
" insert mode
inoremap <C-A> <HOME>
inoremap <C-E> <END>
inoremap jj <ESC>
