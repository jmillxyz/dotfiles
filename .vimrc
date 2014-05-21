set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Bundles
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'slim-template/vim-slim'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'FuzzyFinder'
Plugin 'altercation/vim-colors-solarized'

" Document Formatting
call vundle#end()
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

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

