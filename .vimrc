" what is this I don't even
set nocompatible
" magic vundle stuff
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on

set modelines=0

" tab-settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" again, wtf is this

" project drawer
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']


" again, some steve losh magic
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent

set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" and again...
let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nmap <leader>R :RainbowParenthesesToggle<CR>

set wrap
set linebreak
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

colorscheme molokai

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" I'll regret this...
nnoremap <up> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" B A 
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>

syntax on

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=2

set nobackup
set nowritebackup
set noswapfile

autocmd FileType c,cpp,java,php,python,js autocmd BufWritePre <buffer> :%s/\s\+$//e


