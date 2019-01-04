" ============================================================================
" Misc
" ============================================================================

" Necessary for all the cool stuff
set nocompatible


" ============================================================================
" Visual Improvements
" ============================================================================
syntax on
let t_Co=256
set background=light


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
" set colorcolumn=88


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on


" Show cursor line
set cursorline


" ============================================================================
" Functional Improvements
" ============================================================================
" better copy & paste
" when you want to paste large blocks of code into vim, press f2 before you
" paste. at the bottom you should see ``-- insert (paste) --``.
set pastetoggle=<f2>
if $TMUX == ''
    set clipboard+=unnamed
endif


" mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again



" Bind nohl
" Removes hghlight of your last mearch
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" move code blocks more easily
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Use spaces, not tabs
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


" Quick ESC
imap jj <Esc>

" Search results appear in the middle of the screen!
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz


" ============================================================================
" Language-specific settings
" ============================================================================
" Python
au BufNewFile,BufRead *.py,*.elm set ts=4 sts=4 sw=4 tw=88 expandtab autoindent fileformat=unix
let python_highlight_all=1

" JavaScript, HTML, CSS, babelrc
au BufNewFile,BufRead *.js,*.html,*.css,*.babelrc,*.yml,*.tf set ts=2 sts=2 sw=2


" ============================================================================
" Plugin setup
" ============================================================================
" vim-plug
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'bling/vim-airline'    " jazzy status bar
Plug 'kien/ctrlp.vim'       " fuzzy file search
Plug 'w0rp/ale'             " language server protocol client for neovim
Plug 'tpope/vim-surround'   " replace surrounding characters
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'craigemery/vim-autotag'
Plug 'zivyangll/git-blame.vim'  " run git blame on a line of code with leader-s
Plug 'elmcast/elm-vim'
Plug 'alvan/vim-closetag'
Plug 'ambv/black'
Plug 'mattn/emmet-vim'
Plug 'jremmen/vim-ripgrep'  " grep through source fast
Plug 'rust-lang/rust.vim'   " rust file detection, syntax highlighting, formatting
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Settings for ctrlp
let g:ctrlp_max_height = 10
let g:ctrlp_show_hidden = 1
set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*.tox/*
set wildignore+=*.mypy_cache/*
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Airline Settings
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set laststatus=2

" ALE linting
" choose which linters to enable
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'terraform': ['tflint'],
\}
" only run linters named above (prevent e.g. shellcheck running on sh.j2 files)
let g:ale_linters_explicit = 1
"
" Put ALE status in airline
let g:airline#extensions#ale#enabled = 1

" Let elm-vim format on save
let g:elm_format_autosave = 1

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Fix files
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Required for operations modifying multiple buffers like rename
set hidden

let g:LanguageClient_serverCommands = {
\   'rust': ['rustup', 'run', 'nightly', 'rls'],
\}
let g:LanguageClient_autoStart = 1


" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()


" Automatically reload a changed file (e.g. when switching git branches)
set autoread


" Move new splits to sensible locations
set splitbelow
set splitright


" Virtualenvs for python completion with neovim
let g:python_host_prog = '/Users/jmill/.virtualenvs/neovim-py2/bin/python'
let g:python3_host_prog = '/Users/jmill/.virtualenvs/neovim-py3/bin/python'


" vim-autotags file
let g:autotagTagsFile="tags"


" Enable Emmet, only for HTML/CSS files though
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='a'               " enable all functions in all modes


" Remap <leader> key
" convenient because it's easier to reach than the default (\) and is close to
" `n` and `m` which I use to navigate vim tabs
let mapleader = ","


" easier movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" generic test script hotkey
:nnoremap <Leader>t :!./test.sh<cr>
