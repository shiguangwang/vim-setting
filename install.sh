#!/bin/bash

clear
echo "Prepare VIM environment..."

VIM_RC=$HOME/.vimrc
VIM_DIR=$HOME/.vim

# check VIM python, ruby, perl support
# TODO

# prepare vimrc
if [ -f $VIM_RC ]; then
  mv $VIM_RC $VIM_RC.$(date -u)
fi
ln -s $PWD/vimrc $VIM_RC

# prepare vim directory
if [ -d $VIM_DIR ]; then
  mv $VIM_DIR $VIM_DIR.$(date -u)
fi
mkdir -p $VIM_DIR/bundle

# Get the Vundle plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git $VIM_DIR/bundle/Vundle.vim

# Install the VIM plugins
vim +PluginInstall +qall

echo "All done!"
