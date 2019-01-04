dotfiles
========
My dotfiles for new Macs.

- vim
- tmux
- zsh
- git
- brew
- other utilities...

To Install:
--------
This will backup your current dotfiles into `~/dotfiles_old/`, save all relevant files for
this project in `~/dotfiles`, and the dotfiles themselves in `~`.

    $ git clone https://github.com/jmillxyz/dotfiles.git
    $ cd dotfiles/
    $ ./install.sh

# Text Editing with VIM
Some Plugins
--------
- [vim-plug](https://github.com/gmarik/Vundle.vim) for handling plugins
- [Airline](https://github.com/bling/airline) for awesome status bars
- [Ctrl-P](https://github.com/kien/ctrlp.vim) for fuzzy file searching

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

# Pair Programming with tmux & wemux
- Screen set to 256 colors to show vim over wemux
