#!/bin/bash

clear
echo "Prepare VIM environment..."

VIM_RC=$HOME/.vimrc
VIM_DIR=$HOME/.vim

# check VIM python, ruby, perl support
# make sure you see +python +ruby +perl in vim version
# TODO auto check

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

# Prepare YouCompleteMe
YCM_BUILD=$HOME/ycm_build
if [ -d $YCM_BUILD ]; then
  mv $YCM_BUILD $YCM_BUILD.$(date -u)
fi
mkdir $YCM_BUILD
cd $YCM_BUILD
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release

# Prepare Command-T
COMMAND_T=$VIM_DIR/bundle/command-t/
COMMAND_T_RUBY=$COMMAND_T/ruby/command-t
cd $COMMAND_T_RUBY
make clean
ruby extconf.rb
make

echo "All done!"
