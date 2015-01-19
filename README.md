dotfiles
========
My dotfiles for new Linux VMs.

- vim
- tmux
- zsh
- bash

To Install:
--------
This will backup your current dotfiles into ```~/dotfiles_old/```, save all
relevant files for this project in ```~/dotfiles```, and the dotfiles
themselves in ```~```. Finally, it will download and install the below vim plugins.

    $ git clone https://github.com/dictaeto/dotfiles.git
    $ ./install.sh

# Text Editing with VIM
Plugins
--------
- [Vundle](https://github.com/gmarik/Vundle.vim) for handling plugins
- [Ctrl-P](https://github.com/kien/ctrlp.vim) for fuzzy file searching
- [Powerline](https://github.com/powerline/powerline) for awesome status bars
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for code completion

Functional Enhancements
--------
- Better paste with ```F2```
- Use the mouse to click or highlight text into visual mode
- Rebind ```<Leader>``` key to ```,```
- Esc remapped to ```jj``` so you don't have to move your fingers from the home row
- ```Ctrl-n``` removes highlights from searches
- Easier indentation or dedentation of visual mode code blocks with ```<``` and ```>```
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
