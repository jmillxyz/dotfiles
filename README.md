dotfiles
========
[![Build Status](https://travis-ci.org/jondelmil/dotfiles.svg?branch=master)](https://travis-ci.org/jondelmil/dotfiles)

My dotfiles for new Mac/Linux VMs.

- vim
- tmux
- zsh
- bash

To Install:
--------
This will backup your current dotfiles into ```~/dotfiles_old/```, save all relevant files for this project in ```~/dotfiles```, and the dotfiles themselves in ```~```. Finally, it will download and install the below vim plugins.

    $ git clone https://github.com/jondelmil/dotfiles.git
    $ cd dotfiles/
    $ ./install.sh

# Text Editing with VIM
Plugins
--------
- [Vundle](https://github.com/gmarik/Vundle.vim) for handling plugins
- [Airline](https://github.com/bling/airline) for awesome status bars
- [Ctrl-P](https://github.com/kien/ctrlp.vim) for fuzzy file searching
- [SimpylFold](https://github.com/tmhedberg/SimpylFold) for code folding
- [Indent Python](https://github.com/vim-scripts/indentpython.vim) for corner cases with indenting Python files
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for code completion
- [Syntastic](https://github.com/scrooloose/syntastic) for syntax highlighting
- [Vim Flake8](https://github.com/nvie/vim-flake8) for Python linting


Functional Enhancements
--------
- Better paste with ```F2```
- Use the mouse to click or highlight text into visual mode
- Rebind ```<Leader>``` key to ```,```
- Esc remapped to ```jj``` so you don't have to move your fingers from the home row
- ```Ctrl-n``` removes highlights from searches
- Easier indentation or de-dentation of visual mode code blocks with ```<``` and ```>```
- 1 tab = 4 spaces
- Faster TDD with ```,f``` and ```,t``` for functional and unit tests, respectively
- Move around splits easier with ```<Ctrl>``` + ```h```, ```j```, ```k```, and ```l```

Visual Enhancements
--------
- Show end-of-line whitespace with a red square to limit visually-identical commits
- Line/column highlighting of your cursor
- Show line numbers
- Show 80-column gutter

# Pair Programming with tmux & wemux
tmux
-----
- Screen set to 256 colors to show vim over wemux

wemux
-----
Mac:```brew install wemux```

Linux:```git clone git://github.com/zolrath/wemux.git /usr/local/share/wemux```
