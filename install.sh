#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
############################

########## Variables ##########
# dotfiles directory
dir=$(pwd)

# old dotfiles backup directory
olddir=~/.dotfiles_old

# list of files/folders to symlink in homedir
# TODO: detect these files automatically
files=".gitconfig .global_gitignore .vimrc .vim .tmux.conf .zshrc"
###############################

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~/ ..."
mkdir -p $olddir
echo "done"

# install wombat colorscheme
# mkdir -p ~/.vim/colors && cd ~/.vim/colors
# wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

# change to the dotfiles directory
mkdir -p $dir
echo -n "Changing to the $dir directory ..."
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files
echo "Moving any existing dotfiles from ~/ to $olddir"
for file in $files; do
  if [ -e ~/$file ]
    then
      echo "Moving current $file into $olddir"
      mv ~/$file $olddir/$file
      echo "Copying new $file into home directory."
      if [ -d $dir]
        then
          cp -r $dir/$file ~/$file
        else
          cd ~/dotfiles/
          cp -r $file ~/$file
      fi
    else
      echo "No previous $file. Copying new $file from $dir into home directory."
      if [ -d $dir]
        then
          cp -r $dir/$file ~/$file
        else
          cd ~/dotfiles/
          cp -r $file ~/$file
      fi
  fi
done

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install zsh
echo "installing zsh..."
brew install zsh zsh-completions

# Oh My Zsh framework
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install neovim
echo "installing neovim..."
brew install neovim
source ~/.zshrc
# echo 'export alias vim=nvim' >> ~/.zshrc

# Install plugins in .vimrc with vim-plug
vim +PlugInstall +qall

# pythons
echo "setting up pythons with pyenv..."
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
# echo 'export PATH=$PYENV_ROOT/bin:%PATH"' >> ~/.zshrc
# echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# source ~/.zshrc

pyenv install 3.6.8
pyenv install 3.7.2
pyenv global 3.7.2 3.6.8

git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper
# echo 'pyenv virtualenvwrapper' >> ~/.zshrc
# source ~/.zshrc

# python stuff
echo "installing python tools with pipsi..."
pip install pipsi
pipsi install asciinema
pipsi install httpie
pipsi install magic-wormhole
pipsi install pre-commit
pipsi install tox

# other utilities
echo "installing other utilties via brew..."
brew install wget git youtube-dl tmux mitmproxy watch postgresql wemux

echo "Complete!"
