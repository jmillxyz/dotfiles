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
files=".bashrc .vimrc .vim .tmux.conf .zshrc"
###############################

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~/ ..."
mkdir -p $olddir
echo "done"

# install wombat colorscheme
mkdir -p ~/.vim/colors && cd ~/.vim/colors
wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

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
          cd ~/Development/dotfiles/
          cp -r $file ~/$file
      fi
    else
      echo "No previous $file. Copying new $file from $dir into home directory."
      if [ -d $dir]
        then
          cp -r $dir/$file ~/$file
        else
          cd ~/Development/dotfiles/
          cp -r $file ~/$file
      fi
  fi
done

# Install Vundle first
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install any Plugins included with Vundle
vim +PluginInstall +qall

# Compile YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
python install.py
echo "Complete!"
