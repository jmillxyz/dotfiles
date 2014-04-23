" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set nocompatible              " be iMproved, required
filetype off                  " required

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'slim-template/vim-slim'
Bundle 'L9'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'FuzzyFinder'

" Document Formatting
filetype plugin indent on     " required

set cursorline
set expandtab
set shiftwidth=2
set softtabstop=2
set clipboard=unnamed
set nowrap
set number
set ignorecase
set smartcase

color jellybeans

" Syntastic
let g:syntastic_python_checkers=['pylint']

" Language Formatting
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

" Spacing for Python
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" Quick ESC
imap jj <Esc>

" NerdTree shortcut
map <C-n> :NERDTreeToggle<CR>

