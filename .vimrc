" ViM customizations
" Jon Miller
" 1 Nov 2014
"
" Description/Installation:
" To start, you need the 'Source Code Pro for Powerline' font
" installed (powerline-font on GitHub).


" automatic reloading of .vimrc
autocmd! BufWritePost vimrc nested :source ~/.vimrc


" Necessary for all the cool stuff
set nocompatible


"============================================================================
" Visual Improvements
"============================================================================
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
syntax on
let t_Co=256
set background=dark
let g:wombat256mod_termtrans=1
"let g:wombat256mod_termcolors=256
colorscheme wombat256mod


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on


" Show cursor line and column
set cursorline
set cursorcolumn


"============================================================================
" Functional Improvements
"============================================================================
" better copy & paste
" when you want to paste large blocks of code into vim, press f2 before you
" paste. at the bottom you should see ``-- insert (paste) --``.
set pastetoggle=<f2>
set clipboard=unnamed


" mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Bind nohl
" Removes hghlight of your last mearch
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" History settings
set history=700
set undolevels=700


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" TDD hotness
" Save and Test Django project
map ,t :w\|!../venv/bin/python3 manage.py test<cr>
" Save and run functional test
map ,f :w\|!../venv/bin/python3 functional_tests.py<cr>


" Quick ESC
imap jj <Esc>

"============================================================================
" Plugin setup
"============================================================================
" VUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'                      " Let Vundle manage Vundle
Plugin 'kien/ctrlp.vim'                     " Fuzzy file finder
Plugin 'Valloric/YouCompleteMe'             " Code completion
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'} " Status bar
call vundle#end()


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 10
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python code folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" Powerline
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set laststatus=2


